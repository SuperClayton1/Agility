# Agility
Agile Project Management Database

Concepts and Design
Agility represents an agile project management database, a trusted framework modern organizations use daily. Agile project management platforms typically involve planning and prioritizing tasks by grouping them into a larger initiative and often completing them in short bursts called sprints. In Agility, all of those concepts were thoughtfully represented in the database model and table design. 

Projects
The Projects table represents large business initiatives that may have many smaller tasks associated to them
Projects are associated to a user record - referred to as the Project Owner
I chose to represent those business initiatives in the following categories
New Feature
Refactor
Research
Sprints
The Sprints table represents the time-based groupings in which work is to be completed by its assignees
Each Sprint record will be related to a Project
Each Sprint record will have a required start date and an optional end date denoting how real life sprints can be a matter of hours or days
In a real world example, a Sprint can be a 24 hour long event in which a software development team completes an entire project
Tasks
The tasks table represents the smaller portions of work to be completed that make up the larger project itself
Tasks are related to a user through task assignment
TaskStatus
TaskStatus are the four Status categories that will encompass the state of every task
To Do
In Progress
Review
Done
Receiving Review on your task is mandatory and users that attempt to skip the review process will receive an error

Users
The Users table represents the internal users that may own projects or be assigned to tasks

How to Use Agility
Utilizing Agility is simple due to its intuitive table design. Below is the ERD for Agility to demonstrate tables relationships and references

Example
A common procedure to perform in agile project management is to view all tasks in ‘Review’ status. Typically, tasks needing review are awaiting approvals or blocked. Below is the query to view all of the tasks in  ‘Review’ status for Agility

SELECT t.TaskID, ts.StatusName
FROM dbo.Tasks t
JOIN dbo.TaskStatus ts
   ON t.StatusID = ts.StatusID
WHERE ts.StatusID = 3


Database Functionality
Stored Procedures
Agility has two stored procedures
view projects owned by Users with the ‘Basic’ permission set
View tasks in ‘Review’ status
These stored procedures perform quick queries that pull in projects and tasks that may need support or review

Functions
Agility has two functions
count the number of tasks related to a Sprint
Count the number of tasks assigned to a specific user
These functions take SprintID’s or UserID’s and provide quick relevant metrics on the records
Views
Agility has three views
Show all tasks and the respective statuses
Show all tasks and the respective sprints
Show the permission sets of all project owners
Trigger
Agility has one trigger
Any attempt to move a Status from ‘To Do’ or ‘In Progress’ to ‘Completed’ is blocked and an error message is thrown along with the transaction being rolled back
This is to guard against tasks being completed before receiving proper review
