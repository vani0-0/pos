---
tags: [roles, permissions]
created: 2026-07-01
---

# Roles & Permissions

← [[Performance Operations System]]

---

## Employee

Standard user. Logs their own time and submits daily work hours.

**Authentication**
- Login with Employee ID and password
- Change own password

**Attendance**
- Clock In
- Clock Out
- Start Break
- End Break

**Work Hours**
- Submit work hours (see [[Workflows#Work Hour Submission]])
- Select project from catalog
- Enter work description
- View submitted work logs

**Personal Records**
- View today's hours
- View weekly hours
- View monthly hours
- View attendance history
- View assigned schedule

---

## HR / Administrator

Manages people and day-to-day operations. Does not manage projects or departments — those belong to Developers.

> HR staff are also employees — they clock in/out, take breaks, and submit work hours like everyone else. The capabilities below are **in addition** to all Employee capabilities.

**Employee Management**
- Add employee
- Edit employee information
- Enable / Disable employee
- Reset employee password
- Assign department *(department must already exist)*
- Assign schedule

**Schedule Management**
- Create shift schedules
- Edit shift schedules
- Assign shifts to employees
- Change employee schedules
- Configure rest days

**Attendance**
- View all employee attendance
- Correct time logs
- Approve manual entries
- View late arrivals
- View overtime

**Reports**
- Daily attendance
- Weekly attendance
- Monthly attendance
- Payroll report
- Overtime report
- Export to Excel / PDF

---

## Developer / Head / System Administrator

Full access — maintains the application, master data, and system configuration. Also performs HR tasks when needed (adding employees, correcting logs, etc.).

> Developers are also employees — they clock in/out, take breaks, and submit work hours like everyone else. Developers have access to everything HR can do, plus system-level administration.

**Department Management**
- Add department
- Edit department
- Archive / Delete department

**Project Management**
- Add project
- Edit project
- Archive project
- Reactivate archived project
- Set project code, status, client, dates

**Holiday Management**
- Add holiday
- Edit holiday
- Delete holiday
- Set holiday type (Regular / Special)

**System Administration**
- Manage user roles
- Database backup
- Database restore
- View audit logs
- View system logs
- System configuration
- Manage company settings

---

## Permission Matrix

| Feature                   | Employee |   HR    | Developer |
| ------------------------- | :------: | :-----: | :-------: |
| Clock In / Out            |    ✅     |    ✅    |     ✅     |
| Submit Work Hours         |    ✅     |    ✅    |     ✅     |
| View Own Attendance       |    ✅     |    ✅    |     ✅     |
| View All Attendance       |          |    ✅    |     ✅     |
| Add / Edit Employee       |          |    ✅    |     ✅     |
| Assign Department         |          |    ✅    |     ✅     |
| Assign Schedule           |          |    ✅    |     ✅     |
| Create / Edit Schedule    |          |    ✅    |     ✅     |
| Correct Time Logs         |          |    ✅    |     ✅     |
| Generate Reports          | Own only |   All   |    All    |
| Create / Edit Department  |          |         |     ✅     |
| Create / Edit Project     |          |         |     ✅     |
| Manage Holidays           |          |         |     ✅     |
| Manage User Roles         |          |         |     ✅     |
| Database Backup / Restore |          |         |     ✅     |
| View Audit Logs           |          |         |     ✅     |
| System Settings           |          | Limited |     ✅     |
