SET autocommit=0;

START TRANSACTION;

SELECT SLEEP(3);

INSERT into Authors
(FirstName, SecondName, Books_Count)
SELECT 'Agatha', 'Christie', 74
UNION ALL
SELECT 'Philip', 'Dick', 44

COMMIT;