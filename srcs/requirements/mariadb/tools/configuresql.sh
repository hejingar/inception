#!bin/bash

service mariadb start;


#logs for debug:looks like env isn't reachable
echo $MYSQL_DATABASE
echo $MYSQL_USER
echo $MYSQL_HOSTNAME

# log into MariaDB as root and create database and the user
mariadb -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
mariadb -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mariadb -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
mariadb -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p${MYSQL_ROOT_PASSWORD} shutdown
#mysqladmin -u root shutdown
exec mysqld_safe

#print status
echo "MariaDB database and user were created successfully! "