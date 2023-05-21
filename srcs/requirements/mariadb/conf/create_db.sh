
# env variables: DB_USER, USER_PASS, DB_NAME, ROOT_PASS

service mysql start
cat << EOF > /tmp/init_db.sql
DROP USER IF EXISTS 'testUser'@'%';
DROP DATABASE IF EXISTS test;
CREATE DATABASE IF NOT EXISTS $DB_NAME;
CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$USER_PASS';
GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '$ROOT_PASS';
FLUSH PRIVILEGES;
EOF
mysql -u root < /tmp/init_db.sql
kill `cat /var/run/mysqld/mysqld.pid`
mysqld --skip-log-error 