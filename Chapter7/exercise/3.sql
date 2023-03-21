-- Write a query to return just the month portion of the current date.
SELECT EXTRACT(
        MONTH
        FROM CURRENT_DATE()
    );