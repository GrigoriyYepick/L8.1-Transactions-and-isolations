INSERT into Authors
(FirstName, SecondName, Books_Count)
SELECT 'Arthur', 'Clarke', 21
UNION ALL
SELECT 'Richard', 'Clarke', 10
UNION ALL
SELECT 'Susanna', 'Clarke', 2
UNION ALL
SELECT 'Arthur', 'Doyle', 33