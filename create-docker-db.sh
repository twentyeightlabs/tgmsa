#!/bin/bash

docker run --name tgmsa -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root -d mysqlx  
docker exec -i tgmsa mysql -uroot < accoDb.sql
docker exec -i tgmsa mysql -uroot -proot < accoDb.sql