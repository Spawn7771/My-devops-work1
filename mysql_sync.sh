#!/bin/bash

server1='10.150.4.239'
server2='10.150.4.240'
user_db1=root
user_db2=root
passwd_db1=1
passwd_db2=1
db1=test1
db2=test2

ssh vagrant@$server1 "mysqldump -u$user_db1 -p$passwd_db1 $db1 > ~/test1dump.sql"
scp -3 vagrant@$server1:~/test1dump.sql vagrant@$server2:~
ssh vagrant@$server2 "mysqldump -u$user_db2 -p$passwd_db2 $db2 > ~/test2dump.sql && mysql -u$user_db2 -p$passwd_db2 $db2 < ~/test1dump.sql"
