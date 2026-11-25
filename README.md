# SQL Queries Practice

SQL exercises from the Databases course (MySQL / MariaDB): from basic `SELECT` queries to joins, aggregation, subqueries, DDL/DML, views, stored procedures and triggers, plus a few database designs for websites.

Most exercises use the classic **employees / departments / salary grades** database. Load it first from `databases/employees_database.sql` (or create it with `02_joins/employees_departments_salary_grades_schema_and_joins.sql`).

| Folder | Topics |
|---|---|
| `01_select_filter_and_sort` | `SELECT`, `WHERE`, `ORDER BY`, `DISTINCT`, `LIKE`, `IS NULL` |
| `02_joins` | Inner/outer joins between employees, departments and salary grades; non-equi joins |
| `03_aggregates_group_by_having` | `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`, `GROUP BY`, `HAVING` |
| `04_subqueries` | Scalar, multi-row and correlated subqueries; the same exercise solved three ways |
| `05_ddl_and_dml_create_insert_update_delete` | `CREATE`/`ALTER TABLE`, keys and constraints, `INSERT`, `UPDATE`, `DELETE` (users & messages, students & courses, customers & sales, car rental) |
| `06_views_procedures_functions_triggers` | Views, stored procedures, functions and triggers on a car rental database |
| `07_exam_practice` | Mixed exam practice queries on the employees database |
| `08_website_database_design` | Schemas designed for web projects: users and pages, a game store, a game reviews site |
| `databases` | Database dumps used by the exercises (employees, forum, messages) |

All sample data (names, emails, passwords) is fictional.
