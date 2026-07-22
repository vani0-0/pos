---
tags: [workflows, processes]
created: 2026-07-01
---

# Workflows

← [[Performance Operations System]]

---

## Work Hour Submission

Work logs are submitted throughout the day at each work segment — not as a single end-of-day action.

```
Login
    │
    ▼
Clock In → timestamp saved
    │
    ▼
Submit Work Log
    ├── Select Project
    ├── Enter hours
    └── Enter description
    │
    ▼
Start Break → timestamp saved
    │
    ▼
End Break → timestamp saved
    │
    ▼
Submit Work Log
    ├── Select Project
    ├── Enter hours
    └── Enter description
    │
    ▼
(repeat break/work cycle based on shift schedule)
    │
    ▼
Clock Out → total hours calculated
    │
    ▼
Logout
```

> **Key rule:** Projects are not pre-assigned. Employees pick freely from the active project list. Each work segment between clock-in, breaks, and clock-out gets its own submission.

---

## Department Setup

```
Developer / Head
    │
    ├── Creates "Human Resources"
    ├── Creates "IT Department"
    ├── Creates "Accounting"
    └── Creates "Marketing"
    │
    ▼
HR adds a new employee
    │
    ▼
HR assigns department to the employee
    │
    ▼
Employee belongs to IT Department (or whichever)
```

> **Key rule:** HR cannot create departments — they only assign from the existing list. Departments are created and maintained by Developers.

---

## Project Lifecycle

```
Developer
    │
    ▼
Creates project
    ├── Set project code (e.g., PRJ-042)
    ├── Set project name
    ├── Set client (optional)
    └── Set status = Active
    │
    ▼
Project appears in employee selection list
    │
    ▼
Employees log hours against it
    │
    ▼
Project completed → Developer archives it
    │
    ▼
Archived projects no longer appear in employee selection
(historical logs are preserved)
```

---

## Employee Onboarding

```
HR receives new hire info
    │
    ▼
HR creates employee account
    ├── Name, Employee Number
    ├── Role = Employee
    ├── Assign Department (from existing list)
    └── Assign Schedule / Shift
    │
    ▼
HR sets initial password
    │
    ▼
Employee receives credentials
    │
    ▼
Employee logs in and changes password
```

---

## Attendance Correction

```
Employee clocks in/out with incorrect time
  (e.g., forgot to clock out)
    │
    ▼
HR views attendance log
    │
    ▼
HR opens the time entry
    │
    ▼
HR corrects clock-in or clock-out time
    │
    ▼
Entry status changed to "Corrected"
    │
    ▼
Audit log records the change (who corrected, when, old vs new value)
```

---

## Business Rules

| Rule | Detail |
|---|---|
| Cannot clock in twice | Second clock-in blocked if already active |
| Cannot clock out without clocking in | Clock out button disabled if not clocked in |
| One active shift at a time | No overlapping time entries |
| Break deduction | Total break time deducted from hours worked |
| Overtime threshold | Configurable — system flags entries over X hours |
| Late arrival | Flagged if clock-in is after scheduled start time |
| Missing clock-out | Detected and flagged for HR review |
| Work log hours cannot exceed clock time | Total submitted project hours for a day must not exceed the employee's clocked hours for that day — validated on save |
| Night shift date handling | For shifts crossing midnight, clock-out date is the next calendar day — hours are still attributed to the shift's start date |
| Holiday attendance | Employees are not flagged as late or absent on holidays — holiday type (Regular/Special) affects pay calculation |
| Semi-monthly payroll periods | Period 1: 1st–15th · Period 2: 16th–end of month — reports and payroll summaries filter by these ranges |
