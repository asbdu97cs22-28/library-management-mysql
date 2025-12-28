This repository contains the complete MySQL database schema and data for a Library Management System.
## Features
- Normalized relational schema (Books, Authors, Users, Categories)
- Borrow and return tracking
- Overdue detection using date calculations
- Penalty calculation logic inside SQL
- Indexed columns for performance
- Referential integrity using foreign keys
- Business logic implemented using SQL views

## Key SQL Concepts Used
- Views (borrow_history, all_borrows)
- CASE expressions
- Date arithmetic
- ENUM types
- Indexes
- Transactions
- Foreign key constraints

## How to Run
1. Create a database named `library`
2. Import `library.sql` using phpMyAdmin or MySQL CLI
3. Database will be recreated with schema, data, and views

## Author
Created as part of a Library Management & Recommendation System project.
