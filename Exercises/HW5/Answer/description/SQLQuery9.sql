--Write some differences between procedure and function. 
--Apart from the syntax differences, what are the differences in the use of each one?


--*********************
-- ANSWER:


--1. Return value: A function always returns a value, whereas a procedure may or may not return a value. 
--If a procedure returns a value, it must be through an output parameter.

--2. Usage: A function is typically used in SQL statements as part of an expression, 
--while a stored procedure is typically used to perform an action or a series of actions.

--3. Input parameters: A function can have input parameters, 
--while a procedure can have input and output parameters.

--4. Transaction management: A procedure can be part of a transaction, 
--while a function cannot.

--5. Error handling: A procedure can use the TRY...CATCH block to handle errors,
--while a function cannot.

--6. Nesting: A stored procedure can call another stored procedure or function,
--while a function cannot call a stored procedure.

--7. Permissions: A function can be used in a SELECT statement or in a WHERE clause,
--while a stored procedure requires permission to execute explicitly.

--In summary, functions are used to return a single value based on input parameters, 
--while procedures are used to perform a series of actions or to modify data. 
--Functions are typically used in SQL statements, 
--while stored procedures are typically called from code or other stored procedures. 
--Functions return a value, while procedures may or may not return a value. 
--Procedures can be part of a transaction and can handle errors using TRY...CATCH, while functions cannot.