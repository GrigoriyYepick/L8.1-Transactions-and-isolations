SET autocommit=0;

START TRANSACTION;

UPDATE Authors 
SET Books_Count = 1
WHERE Id < 10;

SELECT SUM(Books_Count) INTO @books
FROM Authors;

SELECT @books;

SELECT SLEEP(10);

ROLLBACK;

/*
SELECT *
FROM Authors;

*/