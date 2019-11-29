sudo yum remove -y mariadb-libs
sudo yum localinstall -y https://dev.mysql.com/get/mysql180-community-release-el7-2.noarch.rpm
sudo yum install -y mysql-community-server
mysql --version
mysqld --version

sudo systemctl start mysqld
systemctl is-enabled mysqld
sudo systemctl enabled mysqld
sudo systemctl stop mysqld
sudo systemctl restart mysqld


sudo systemctl start mysqld
grep passwrod /var/log/mysqld.log
mysql -u root -p
CREATE DATABASES test_db;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'Test@1234';
SET PASSWORD FOR root@localhost=PASSWORD('Test@1234');
mysql -u root -p
mysql -u root
sudo vi /etc/my.cnf

sudo systemctl restart mysqld
mysql -u root

mysql -u root -p
exit
CREATE DATABASE test_db;
SHOW DATABASES;
USE test_db;
mysql -u root -p test_db
DROP DATABASE test_db;
CREATE TABLE users (id int, name varchar(255));
SHOW TABLES;

DESC users;
DROP TABLE users;
INSERT INTO users (id, name) VALUES (1, 'tky');
INSERT INTO users VALUES (2, 'tkgcci');
INSERT INTO users VALUES (3, 'takagotch'), (4, 'yoshioka'), (5, 'yoshitaka');
SELECT * FROM users;
SELECT name FROM users;
SELECT * FROM users WHERE name = 'tky';
SELECT * FROM users WHERE id IN (1, 3);
UPDATE users SET id = 6, name = 'tkytky' WHERE name = 'tky';
DELETE FROM users WHERE id = 6;
mysqldump -u root -p test_db > ~/test_db.dump
mysql -u root -p test_db < ~/test_db.dump
TRUNCATE TABLE users;
SELECT * FROM users;
SHOW VARIABLES LIKE '%char%';


