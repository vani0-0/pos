---
tags: [project, time-management, desktop-app]
created: 2026-07-01
status: planning
---

# Performance Operations System

A desktop application that allows employees to log in, clock in/out, record work hours, and submit daily work logs. Administrators manage employees, schedules, and attendance. Developers maintain organizational data and system configuration.

---

## Index

- [[Roles & Permissions]]
- [[Features]]
- [[Database Schema]]
- [[Workflows]]
- [[Architecture]]
- [[Development Roadmap]]

---

## At a Glance

|                |                                                                |
| -------------- | -------------------------------------------------------------- |
| **Type**       | Desktop Application                                            |
| **Platform**   | Windows                                                        |
| **Frontend**   | Flutter (Desktop)                                              |
| **Backend**    | .NET Web API (C#)                                              |
| **Database**   | MySQL (primary · central server)                               |
| **Offline DB** | SQLite (local fallback · syncs to MySQL on reconnect)          |
| **Roles**      | Employee · HR · Developer/Head                                 |
| **Deployment** | Installed on every machine · multiple employees can be logged in on the same machine simultaneously |
| **Pay Cycle**  | Semi-monthly (1st–15th · 16th–end of month)                    |

## Core Concept

Employees clock in/out, take breaks, then submit work hours at end of day by selecting a project from a shared catalog and writing a brief description. No pre-assignment of projects needed — employees simply pick the relevant project when submitting.

HR handles all people-related work: adding employees, managing schedules, correcting attendance, and generating reports.

Developers maintain the master data (departments, projects) and handle all system-level administration.
