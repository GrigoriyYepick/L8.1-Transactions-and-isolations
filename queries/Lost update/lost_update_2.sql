START TRANSACTION;

SELECT Books_Count INTO @DoyleBooks
FROM Authors 
WHERE FirstName = 'Arthur' AND SecondName = 'Doyle';

# SELECT @ArthursBooks;

SELECT SLEEP(3);

SET @DoyleBooks = @DoyleBooks + 100 ;

UPDATE Authors 
SET Books_Count = @DoyleBooks
WHERE FirstName = 'Arthur' AND SecondName = 'Doyle';

SELECT @DoyleBooks;

COMMIT;