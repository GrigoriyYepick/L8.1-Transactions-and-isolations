SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

START TRANSACTION;

SELECT SLEEP(3);

SELECT SUM(Books_Count) INTO @books2
FROM Authors;

SELECT @books2;

COMMIT;