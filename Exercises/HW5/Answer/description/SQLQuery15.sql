--Write the differences between assertions and table-level constraints.


--ANSWER:

--Assertions and table-level constraints are both mechanisms for enforcing data integrity in a relational database, but they differ in their scope and usage.



--1. Scope: A table-level constraint is a rule that is applied to a single table, while an assertion can be applied to multiple tables or views.

--2. Timing: Table-level constraints are checked automatically by the database management system whenever data is modified, inserted, or deleted in the table, while assertions are checked explicitly by the application or user when the assertion is invoked.

--3. Type of constraint: Table-level constraints are typically used to enforce simple rules such as primary keys, foreign keys, unique constraints, and check constraints, while assertions are used to enforce more complex rules that involve multiple tables or views, or rules that cannot be expressed using simple constraints.

--4. Syntax: Table-level constraints are defined using DDL statements such as CREATE TABLE or ALTER TABLE, while assertions are defined using the ASSERTION statement.

--5. Error handling: When a table-level constraint is violated, the database management system returns an error message and rolls back the transaction if it cannot be resolved. When an assertion is violated, the application or user must handle the error and take appropriate action.

--In summary, table-level constraints are used to enforce simple rules at the table level, while assertions are used to enforce more complex rules that involve multiple tables or views. Table-level constraints are checked automatically by the database management system, while assertions are checked explicitly by the application or user.