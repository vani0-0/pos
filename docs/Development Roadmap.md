---
tags: [roadmap, planning]
created: 2026-07-01
---

# Development Roadmap

← [[Performance Operations System]]

---

## MVP Scope

The first version should be fully usable end-to-end, even if some advanced features come later.

| Included in MVP | |
|---|---|
| Login with role-based access | ✅ |
| Employee management (add, edit, disable) | ✅ |
| Department management | ✅ |
| Schedule/shift management | ✅ |
| Clock In / Clock Out | ✅ |
| Break tracking | ✅ |
| Automatic hours calculation | ✅ |
| Work hour submission with project selection | ✅ |
| Project management (add, archive) | ✅ |
| Daily and weekly timesheet view | ✅ |
| Attendance history | ✅ |
| Attendance correction (by HR) | ✅ |
| Basic reports (daily, weekly, monthly) | ✅ |
| Export reports to Excel / PDF | ✅ |
| Audit log | ✅ |
| Database backup | ✅ |

---

## Timeline

| Phase | Description | Est. Duration | Start | End | Status |
|---|---|:---:|---|---|---|
| Phase 1 | Foundation | 1–2 weeks | | | Not Started |
| Phase 2 | Core Attendance | 1–2 weeks | | | Not Started |
| Phase 3 | HR Operations | 2–3 weeks | | | Not Started |
| Phase 4 | Work Logs | 1–2 weeks | | | Not Started |
| Phase 5 | Dashboard | 1–2 weeks | | | Not Started |
| Phase 6 | Reports | 2–3 weeks | | | Not Started |
| Phase 7 | Administration | 1–2 weeks | | | Not Started |
| Phase 8 | Polish & QA | 1–2 weeks | | | Not Started |

**Total estimate:** 10–18 weeks

> Fill in Start and End dates as you go. Status options: `Not Started` · `In Progress` · `Done` · `On Hold`

---

## Phases

### Phase 1 — Foundation
- Project setup
- Database design and creation
- User authentication (login, password hashing, sessions)
- Role-based access control
- Basic app shell / navigation

### Phase 2 — Core Attendance
- Clock In / Clock Out
- Break tracking
- Automatic hours calculation
- Business rules (no duplicate clock-in, missing clock-out detection)

### Phase 3 — HR Operations
- Employee management (add, edit, disable)
- Department management
- Schedule / shift management
- Assign employees to departments and schedules

### Phase 4 — Work Logs
- Project management (Developer)
- Work hour submission (Employee)
- Multiple project entries per day
- Work log history

### Phase 5 — Dashboard
- Employee dashboard (today's hours, schedule, recent logs)
- HR dashboard (clocked-in employees, attendance summary, pending corrections)

### Phase 6 — Reports
- Daily / weekly / monthly attendance
- Payroll hours summary
- Overtime report
- Tardiness / late arrivals
- Missing clock-outs
- Employee work log by project
- Export to Excel / PDF

### Phase 7 — Administration
- Audit log viewer
- System logs
- Database backup and restore
- Company settings (overtime rules, work hours, holidays)

### Phase 8 — Polish & QA
- Full end-to-end testing
- Edge case handling
- Performance testing
- UI/UX refinements
- Documentation

---

## Future Phases (Post-MVP)

| Feature | Notes |
|---|---|
| Leave request and approval | |
| Email / in-app notifications | |
| Biometric login | |
| RFID / QR code clock in/out | |
| GPS verification | |
| Cloud sync / multi-office | |
| Mobile companion app | |
| Payroll system integration | |
| Face recognition | |

---

## Technology Stack (Decided)

| Layer | Decision |
|---|---|
| **Frontend** | Flutter (Windows Desktop) |
| **Backend** | .NET Web API (C#) |
| **Primary Database** | MySQL (central server) |
| **Offline Database** | SQLite (local per machine, syncs to MySQL) |
| **Auth** | JWT tokens · Bcrypt password hashing · role-based access |
| **API** | REST (Flutter ↔ .NET) |
| **Excel Export** | ClosedXML (.NET) |
| **PDF Export** | QuestPDF (.NET) |

> See [[Architecture]] for how the layers connect and how offline sync works.
