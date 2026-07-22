---
tags: [architecture, tech-stack]
created: 2026-07-01
---

# Architecture

← [[Performance Operations System]]

---

## System Overview

```
┌──────────────────────────────────────────┐
│           Employee's Machine             │
│                                          │
│  ┌──────────────┐    ┌────────────────┐  │
│  │ Flutter App  │───▶│ SQLite (local) │  │
│  │  (Desktop)   │    │  offline cache │  │
│  └──────┬───────┘    └───────┬────────┘  │
│         │ REST API           │ sync      │
└─────────┼────────────────────┼───────────┘
          │                    │
          ▼                    ▼
┌─────────────────────────────────────────┐
│         .NET Web API (Server)           │
│              (C# backend)               │
└────────────────────┬────────────────────┘
                     │
                     ▼
          ┌─────────────────────┐
          │    MySQL Database   │
          │   (central server)  │
          └─────────────────────┘
```

- Flutter sends all requests to the .NET API
- The .NET API handles all business logic and talks to MySQL
- If the API is unreachable, Flutter falls back to local SQLite
- When connectivity is restored, pending local changes sync to the server

---

## Online Mode (Normal)

```
Flutter App
    │
    │  REST API call (session token)
    ▼
.NET Web API
    │
    ▼
MySQL Database
    │
    ▼
Response returned to Flutter
```

All clock-ins, clock-outs, work log submissions, and HR actions go through the API directly.

---

## Offline Mode (Fallback)

Triggered automatically when the API is unreachable.

```
Flutter App detects API unavailable
    │
    ▼
Switches to SQLite (local)
    │
    ▼
Employee actions saved locally
with SyncStatus = Pending
    │
    ▼
App reconnects to API
    │
    ▼
Sync service sends pending records to server
    │
    ▼
Server validates and saves
    │
    ▼
Local SyncStatus updated to Synced
```

---

## What Is Stored Locally (SQLite)

Only the data the employee needs to function without the server.

| Data | Stored Locally | Notes |
|---|---|---|
| Employee's own TimeEntries | ✅ | Pending sync on reconnect |
| Employee's own WorkLogs | ✅ | Pending sync on reconnect |
| Active project list | ✅ | Read-only cache, refreshed on login |
| Employee's schedule | ✅ | Read-only cache, refreshed on login |
| Other employees' data | ❌ | Server only |
| HR operations | ❌ | Server only — HR features require connectivity |
| Reports | ❌ | Generated server-side |

HR and Developer features (adding employees, managing schedules, generating reports) **require an active connection** — offline mode is employee-only.

---

## Sync Rules

| Rule | Detail |
|---|---|
| Sync on reconnect | Pending records are sent to the API as soon as connectivity is restored |
| Sync order | TimeEntries before WorkLogs (FK dependency) |
| Server wins on conflict | If the server already has a record for the same slot (e.g., HR corrected a time entry while employee was offline), the server's version is kept and the local version is discarded |
| Duplicate clock-in guard | Before saving offline clock-in, check if an open TimeEntry already exists locally — same rule as online mode |
| Failed sync | Marked as SyncStatus = Failed, surfaced to the employee with a prompt to contact HR |

---

## Server Discovery

The app is on the office LAN. No cloud, no DNS setup needed.

- The office server is given a fixed **hostname** on the local network (e.g., `POSSERVER`)
- During installation, a `config.json` is placed in the app's directory with the server address:
  ```json
  { "server_url": "http://POSSERVER:5000" }
  ```
- All machines on the LAN use the same hostname — IT sets it once per machine during deployment
- If the server is ever moved or renamed, IT updates `config.json` on each machine

---

## Authentication

Sessions use a **server-side session token**, not a self-expiring JWT. This gives full control over who is logged in.

**Login flow:**
1. Employee enters Employee ID + password
2. API validates credentials against MySQL
3. API creates a session record in the database, returns a session token
4. Flutter stores the token securely on disk (persists across app restarts)
5. Every API request includes the token — server validates it against the session record

**Logout:**
- Employee clicks logout → Flutter deletes local token → API deletes the session record
- Session is immediately dead — no grace period

**No expiry:**
- Sessions do not expire on a timer
- A session ends only when the employee explicitly logs out
- Employees do not need to log in again just because the app was closed and reopened

**Account disabled:**
- If HR disables an employee's account, the session record is marked invalid
- The employee's next API call returns 401 — the app immediately shows "Account disabled" and forces logout
- This works even if the employee is currently clocked in on another machine

**Offline:**
- If the API is unreachable, the app falls back to local SQLite using the cached session
- The session is considered valid locally as long as it hasn't been explicitly logged out

---

## API Structure (High Level)

| Group | Endpoints |
|---|---|
| Auth | POST /auth/login · POST /auth/change-password |
| Attendance | POST /attendance/clock-in · POST /attendance/clock-out · POST /attendance/break-start · POST /attendance/break-end |
| Work Logs | POST /worklogs · GET /worklogs/{date} |
| Employees | GET/POST/PUT /employees · PUT /employees/{id}/status |
| Schedules | GET/POST/PUT /schedules |
| Projects | GET/POST/PUT /projects |
| Departments | GET/POST/PUT /departments |
| Holidays | GET/POST/PUT/DELETE /holidays |
| Reports | GET /reports/attendance · GET /reports/payroll · GET /reports/overtime |
| Sync | POST /sync/push (offline records batch upload) |
| Admin | /admin/backup · /admin/audit-logs · /admin/users |

---

## Decisions Log

| Question | Decision |
|---|---|
| Where is the API hosted? | Office LAN server (on-premise) |
| How does the app find the server? | Fixed hostname in `config.json`, set by IT on install |
| Multiple users on same machine? | Yes — multiple employees can be logged in simultaneously on the same machine |
| Do sessions expire? | No — sessions last until the user logs out |
| What if session expires while offline? | Does not apply — sessions have no expiry |
| What if HR disables an account? | Session is immediately invalidated server-side — next API call forces logout |
