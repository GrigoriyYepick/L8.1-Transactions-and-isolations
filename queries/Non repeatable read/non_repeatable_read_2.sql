SET autocommit=0;

START TRANSACTION;

SELECT SLEEP(3);

UPDATE Authors 
SET Books_Count = 1
WHERE Id < 10;

COMMIT;