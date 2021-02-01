CREATE DATABASE IF NOT EXISTS db1;
GRANT ALL PRIVILEGES ON db1.* TO 'user1'@'%' ;
GRANT FILE ON *.* TO 'user1'@'%';
USE db1;

CREATE TABLE Authors (
  Id INT AUTO_INCREMENT PRIMARY KEY,
  FirstName VARCHAR(255) NOT NULL,
  SecondName VARCHAR(255) NOT NULL,
  Books_Count INT NOT NULL
) ENGINE=INNODB;