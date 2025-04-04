/*
 What is a Window Function?
A window function performs a calculation across a set of table rows that are somehow related to the current row. 
The “window” refers to the set of rows used for the calculation.

Syntax:
function_name (expression) OVER (
    PARTITION BY column1
    ORDER BY column2
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
)

Components of a Window Function:
Function Name: The operation to perform (SUM(), AVG(), RANK(), etc.)

OVER(): Required for window functions.

PARTITION BY (Optional): Divides the result set into partitions.

ORDER BY (Optional): Defines the logical order of the rows within each partition.

ROWS/RANGE (Optional): Defines the frame (subset of rows) for the calculation.


📋 Common Window Functions
=========================================================
Here’s a breakdown of the most used window functions:
======================================================================
1. ROW_NUMBER()
Assigns a unique number to each row starting from 1 in each partition.
ROW_NUMBER() OVER (PARTITION BY department ORDER BY salary DESC)
🧠 Use Case: Ranking employees by salary within each department.
======================================================================
2. RANK()

Gives ranks to rows but gives the same rank to ties, skipping the next rank.

RANK() OVER (ORDER BY marks DESC)
🧠 Use Case: Assigning rank to students by marks.
=======================================================================
3. DENSE_RANK()
Similar to RANK() but does not skip ranks when values are the same.
DENSE_RANK() OVER (ORDER BY marks DESC)
🧠 Use Case: Rankings where no rank numbers are skipped.
=======================================================================
4. NTILE(n)
Divides the rows into n equal parts and assigns a bucket number.
NTILE(4) OVER (ORDER BY salary)
🧠 Use Case: Quartile grouping of employees based on salary.
=======================================================================
5. LAG()
Accesses previous row's value.
LAG(salary, 1) OVER (ORDER BY id)
🧠 Use Case: Calculate the difference from the previous row.
=======================================================================
6. LEAD()
Accesses next row's value.
LEAD(salary, 1) OVER (ORDER BY id)
🧠 Use Case: Compare current value with the next row.
=======================================================================
7. FIRST_VALUE()
Returns the first value in the window frame.
FIRST_VALUE(salary) OVER (PARTITION BY department ORDER BY hire_date)
🧠 Use Case: Get the earliest hired employee's salary in each department.
=======================================================================
8. LAST_VALUE()
Returns the last value in the window frame.
LAST_VALUE(salary) OVER (PARTITION BY department ORDER BY hire_date)
🧠 Use Case: Get the latest hired employee's salary.
🔔 Note: LAST_VALUE() may not behave as expected unless you specify the right ROWS BETWEEN frame.
=======================================================================
9. CUME_DIST()
Calculates the cumulative distribution: percentage of rows with value less than or equal to the current row.

CUME_DIST() OVER (ORDER BY salary)
🧠 Use Case: Percentile calculation.
=======================================================================
10. PERCENT_RANK()
Computes the percent rank of a row in a partition.
PERCENT_RANK() OVER (ORDER BY salary)
🧠 Use Case: Rank employees by percentile.
=======================================================================
11. Aggregate Functions as Window Functions
You can also use SUM(), AVG(), MIN(), MAX(), and COUNT() as window functions.
SUM(salary) OVER (PARTITION BY department ORDER BY hire_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
🧠 Use Case: Running total of salary in each department over time.
=======================================================================
*/