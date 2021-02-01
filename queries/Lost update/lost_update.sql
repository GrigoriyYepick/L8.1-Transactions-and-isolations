START TRANSACTION;

SELECT SUM(Books_Count) INTO @ArthursBooks
FROM Authors 
GROUP BY FirstName
HAVING FirstName = 'Arthur';

# SELECT @ArthursBooks;

SELECT SLEEP(7);

SET @ArthursBooks = @ArthursBooks / 2 ;

UPDATE Authors 
SET Books_Count = @ArthursBooks
WHERE FirstName = 'Arthur';

SELECT @ArthursBooks;

COMMIT;

/*
SELECT *
FROM Authors 
WHERE FirstName = 'Arthur'

SELECT *
FROM Authors

UPDATE Authors
SET Books_Count = 21
WHERE Id = 1;

UPDATE Authors
SET Books_Count = 33
WHERE Id = 4;

*/



