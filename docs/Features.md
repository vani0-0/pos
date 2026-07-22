---
tags: [features, modules]
created: 2026-07-01
---

# Features

← [[Performance Operations System]]

---

## Module Map

```
Login
│
├── Dashboard
│
├── Attendance (Clock In/Out, Breaks)
│
├── Work Hours (Submit, View)
│
├── Employee Management          [HR]
│
├── Schedule Management          [HR]
│
├── Attendance Management        [HR]
│
├── Reports                      [HR + Dev]
│
├── Department Management        [Dev]
│
├── Project Management           [Dev]
│
└── System Administration        [Dev]
    ├── User Roles
    ├── Holiday Management
    ├── Database Backup
    ├── Audit Logs
    ├── System Logs
    └── Company Settings
```

---

## Authentication

- Login with Employee ID and password
- Role-based access (Employee / HR / Developer)
- Session timeout after inactivity
- Password reset (by HR)
- Change own password

---

## Attendance

- Clock In — records timestamp
- Clock Out — records timestamp, calculates hours
- Start Break / End Break — deducted from total
- Manual entry (with manager approval)
- Automatic overtime detection (after configured threshold)
- Late arrival flag
- Missing clock-out detection

---

## Work Hour Submission

- Submitted per work segment throughout the day — not a single end-of-day action
- Each submission: select project, enter hours, enter description
- Triggered after clocking in and after each break ends
- Multiple submissions per day (one per work segment)
- Total submitted hours **cannot exceed** clocked hours for that day (validated on save)
- View history of submitted logs

---

## Employee Management

- Add new employee (name, ID, role, department, schedule)
- Edit employee information
- Enable / Disable employee account
- Reset password
- Assign to department
- Assign schedule / shift

---

## Schedule Management

- Create named shifts (e.g., Morning, Night, Mid)
- Define start time, end time, break duration
- Night shifts (cross-midnight) supported — e.g., 10 PM – 6 AM
- Assign shifts to employees
- Configure rest days per shift (varies per shift, not global)
- Rotating schedule support

---

## Reports

| Report | Audience |
|---|---|
| Daily Attendance | HR, Dev |
| Weekly Attendance | HR, Dev |
| Monthly Attendance | HR, Dev |
| Payroll Summary (semi-monthly) | HR, Dev |
| Overtime | HR, Dev |
| Tardiness / Late Arrivals | HR, Dev |
| Missing Clock-outs | HR, Dev |
| Employee Work Log by Project | HR, Dev |

Export formats: Excel, PDF, CSV

---

## Department Management

- Add department
- Edit department name / info
- Archive or delete department
- View employees per department

---

## Project Management

- Add project (code, name, client, dates, status)
- Edit project details
- Archive project (removed from employee selection)
- Reactivate archived project
- Projects are **not** assigned to employees — employees choose from the active catalog when submitting hours

---

## Holiday Management

- Add holiday (name, date, type)
- Edit holiday
- Delete holiday
- Holiday types: **Regular** (full day, double pay rules apply) / **Special** (different rate)
- Holidays affect attendance flags — employees are not marked late/absent on holidays
- Holidays affect overtime calculations

## System Administration

- User role management
- Database backup and restore
- Audit log viewer (who did what, when)
- System log viewer
- Company settings (name, work hours, overtime rules, pay cycle)

OvertimeIngestion / Payslip
---

## Future Features (Post-MVP)

- Biometric login
- RFID / QR code clock in/out
- GPS verification
- Face recognition
- Leave request and approval
- Email notifications
- Cloud sync
- Mobile companion app
- Payroll system integration
