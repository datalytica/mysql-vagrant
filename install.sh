#!/usr/bin/env bash

sudo apt-get update
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
sudo apt-get install -y vim curl python-software-properties
sudo apt-get update
sudo apt-get -y install mysql-server
sed -i "s/^bind-address/#bind-address/" /etc/mysql/my.cnf
mysql -u root -proot -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION; FLUSH PRIVILEGES;"
sudo service mysql restart
echo "Loading the database... (could take a while)"
curl http://downloads.mysql.com/docs/sakila-db.tar.gz > ./sakila-db.tar.gz
tar -zxvf ./sakila-db.tar.gz
cat ./sakila-db/sakila-schema.sql | mysql -u root -proot
cat ./sakila-db/sakila-data.sql | mysql -u root -proot

mysql -u root -proot -e "GRANT ALL PRIVILEGES ON sakila.* TO 'sakila'@'%' IDENTIFIED BY 'sakila' WITH GRANT OPTION; FLUSH PRIVILEGES;"
echo "...done"
