#!/bin/bash


#Mysql production

production_host='10.150.4.239'
production_login=root
production_pass=1
prod_db=test1

#Mysql stage

stage_host='10.150.4.240'
stage_login=root
stage_pass=1
stage_db=test2

mysqldump -u$production_login -h $production_host -p$production_pass $prod_db > ~/prod_dump.sql
mysqldump -u$stage_login -p$stage_pass $stage_db > ~/stage_dump.sql && mysql -u$stage_login -p$stage_pass $stage_db < ~/prod_dump.sql
