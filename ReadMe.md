# Student Mentorship Program System - Storyboard

## Git Hub repo: ( https://github.com/HazhanHallwan/csc548-StudentMentorshipProgramSystem-group-ArwanAwat-HazhanHalwan-KizheOthman-MohammedHaydar )


## Project Information
**Project Title:** Student Mentorship Program System  
**Team Members:** 
Hazhan Halwan QIU23-0418 
Kizhe Othman QIU23-0423
Arwan Awat QIU23-0265
Mohammed Haydar QIU23-0421

**Course:** CSC584 ENTERPRISE PROGRAMMING	

**Deliverable:** 1 -- Group Project  Storyboard (HTML Flow) + Database ERD

## Purpose
This storyboard demonstrates the complete user flow and page structure for a web-based Student Mentorship Program System. The system facilitates matching students with mentors, scheduling sessions, and tracking mentorship progress.

## How to Navigate
1. Start at `index.jsp` - the main sitemap that links to all pages
2. The system has four main modules:
   - **Authentication** (auth/): Login and registration
   - **Dashboard** (dashboard/): Overview with KPIs and charts
   - **Students Module** (students/): Full CRUD operations
   - **Mentors Module** (mentors/): Mentor management
   - **Matches Module** (matches/): Mentor-student pairing
   - **Sessions Module** (sessions/): Session scheduling and tracking

## Key Features
- User authentication (login/register)
- Dashboard with KPIs and analytics charts
- Complete CRUD for Students (list, create, view details, edit)
- Mentor registration and management
- Intelligent mentor-student matching
- Session scheduling and tracking
- Progress monitoring

## File Structure
StudentMentorshipProgramSystem\Web/
├── META-INF/
├── WEB-INF/
│   └── web.xml
├── assets/
│   └── styles.css
├── auth/
│   ├── login.jsp
│   └── register.jsp
├── dashboard/
│   └── dashboard.jsp
├── matches/
│   ├── list.jsp
│   ├── create.jsp
│   └── details.jsp
├── mentors/
│   ├── list.jsp
│   └── create.jsp
├── sessions/
│   ├── list.jsp
│   └── create.jsp
├── students/
│   ├── list.jsp
│   ├── create.jsp
│   ├── edit.jsp
│   └── details.jsp
│── index.jsp
│──ERD_MentorshipSystem.png
│──schema.sql
└──ReadMe.md


## ERD Location

![Image](ERD_MentorshipSystem.png)

The Entity Relationship Diagram is located at: `StudentMentorshipProgramSystem\Web\ERD_MentorshipSystem.png`

The Entity Relationship Diagram schema is located at: `StudentMentorshipProgramSystem\Web\schema.sql`




## Notes & Assumptions
- All pages use semantic HTML5 tags
- Navigation links allow users to move between all pages
- Dashboard includes 4 KPI placeholders and 2 chart placeholders
- Students module demonstrates full CRUD functionality
- The system assumes role-based access (Admin, Mentor, Student)
- Matching algorithm will use skills, interests, and availability
- Sessions can be scheduled online or on-campus

