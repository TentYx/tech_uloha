#!/bin/bash

dump=backup.sql.`date +"%Y%m%d"`
dbsrv=x.x.x.x
user=user
pass=password

#backup from the local machine (I assume that $INT_DB can be seen in output from  "printenv" command)
mysqldump --username=${user} --password=${pass} --single-transaction --quick --lock-tables=false $INT_DB | gzip > ${dump}.gz


#use this command to backup DB on the remote server
mysqldump --username=${user} --password=${pass} --protocol=TCP --host=${dbsrv} --single-transaction --quick --lock-tables=false $INT_DB | gzip > ${dump}.gz

#put this inside cronjob to run it every 12 hours 
#0 */12 * * * /path/to/script/sql_backup.sh
