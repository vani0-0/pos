---
tags: [database, schema]
created: 2026-07-01
---

# Database Schema

← [[Performance Operations System]]

---

## Users

| Column | Type | Notes |
|---|---|---|
| UserID | INT (PK) | Auto-increment |
| EmployeeNumber | VARCHAR | Unique |
| Username | VARCHAR | Login identifier |
| PasswordHash | VARCHAR | Bcrypt or Argon2 |
| FirstName | VARCHAR | |
| LastName | VARCHAR | |
| Role | ENUM | Employee / HR / Developer |
| DepartmentID | INT (FK) | → Departments |
| ScheduleID | INT (FK) | → Schedules |
| Status | ENUM | Active / Inactive |
| CreatedAt | DATETIME | |

---

## Departments

| Column | Type | Notes |
|---|---|---|
| DepartmentID | INT (PK) | |
| DepartmentName | VARCHAR | |
| Status | ENUM | Active / Archived |

---

## Schedules

| Column | Type | Notes |
|---|---|---|
| ScheduleID | INT (PK) | |
| ScheduleName | VARCHAR | e.g., Morning Shift |
| StartTime | TIME | |
| EndTime | TIME | |
| CrossesMidnight | BOOLEAN | TRUE if shift ends the next calendar day (e.g., 10 PM – 6 AM) |
| BreakMinutes | INT | Standard break duration |

## ScheduleRestDays

Rest days are stored per shift in a separate table, not as a comma-separated string.

| Column | Type | Notes |
|---|---|---|
| RestDayID | INT (PK) | |
| ScheduleID | INT (FK) | → Schedules |
| DayOfWeek | ENUM | Monday / Tuesday / Wednesday / Thursday / Friday / Saturday / Sunday |

---

## TimeEntries

| Column | Type | Notes |
|---|---|---|
| EntryID | INT (PK) | |
| UserID | INT (FK) | → Users |
| ClockIn | DATETIME | |
| ClockOut | DATETIME | Nullable if still clocked in |
| HoursWorked | DECIMAL | Calculated on clock out |
| BreakMinutes | INT | Total break time |
| Status | ENUM | Open / Closed / Corrected |
| Date | DATE | Work date |

---

## Breaks

| Column | Type | Notes |
|---|---|---|
| BreakID | INT (PK) | |
| EntryID | INT (FK) | → TimeEntries |
| BreakStart | DATETIME | |
| BreakEnd | DATETIME | Nullable if break is ongoing |

---

## Projects

| Column | Type | Notes |
|---|---|---|
| ProjectID | INT (PK) | |
| ProjectCode | VARCHAR | e.g., PRJ-001 |
| ProjectName | VARCHAR | |
| Client | VARCHAR | Optional |
| Status | ENUM | Active / Archived |
| StartDate | DATE | Optional |
| EndDate | DATE | Optional |

---

## WorkLogs

| Column | Type | Notes |
|---|---|---|
| WorkLogID | INT (PK) | |
| UserID | INT (FK) | → Users |
| ProjectID | INT (FK) | → Projects |
| Date | DATE | Work date |
| Hours | DECIMAL | Hours worked on project |
| Description | TEXT | Task description |
| SubmittedAt | DATETIME | |

---

## Holidays

| Column | Type | Notes |
|---|---|---|
| HolidayID | INT (PK) | |
| Name | VARCHAR | e.g., "New Year's Day" |
| Date | DATE | |
| Type | ENUM | Regular / Special |

> **Regular** — full day off, double-pay rules apply on attendance/overtime calculations.
> **Special** — typically 30% additional pay; employees may still be required to work.

---

## AuditLogs

| Column | Type | Notes |
|---|---|---|
| LogID | INT (PK) | |
| UserID | INT (FK) | → Users |
| Action | VARCHAR | e.g., CLOCK_IN, EDIT_EMPLOYEE |
| Details | TEXT | JSON or plain text |
| Timestamp | DATETIME | |

---

## Notes

- An employee can have multiple `WorkLogs` per day (one per project)
- `TimeEntries` tracks clock in/out; `WorkLogs` tracks what was worked on — they are separate
- Total `WorkLogs.Hours` for a given day cannot exceed `TimeEntries.HoursWorked` for that day — enforced at application level
- Projects are **not linked to users** ahead of time — any employee can select any active project
- Soft-delete via `Status` field instead of hard deletes where possible
- Night shifts: when `CrossesMidnight = TRUE`, the clock-out date will be the day after the clock-in date — all hour calculations must account for this
- Rest days vary per shift — stored in `ScheduleRestDays`, not on the `Schedules` row
- Pay cycle is semi-monthly: Period 1 = 1st–15th, Period 2 = 16th–end of month. Payroll reports filter by these date ranges
