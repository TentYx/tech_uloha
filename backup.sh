#!/bin/bash

##############################################################################
#									     									 #
#  Crontab configuration:  00 12 * * * /home/tino/Desktop/uloha/backup.sh	 #
#									     									 #
##############################################################################

#vars
bak_dir=/home/tino/Desktop/example
ssh_path=/home/tino/.ssh
filename="backup_`date +%Y``date +%m``date +%d`.tar.gz"
#dump=backup.sql.`date +"%Y%m%d"`
#user=user
#pass=password

#compress of file and move it to folder where it is going to be stored
tar cvf $bak_dir/$filename -T folder_set.config

#send on remote host - prerekvizita bola vygenerovanie ssh klucov, ktore boli nasledne vymenene medzi hostami/servermi
rsync -av -e "ssh -i $ssh_path/test_key" $bak_dir/$filename tino@192.168.100.4:$home_dir/sent

#find and remove files older than 3 days
find "$bak_dir" -mtime +3 -type f -exec rm -fv {} \;

#backup from the local machine (use --all-databases for backuping every db)
#mysqldump --username=${user} --password=${pass} --single-transaction --quick --lock-tables=false my_db | gzip > ${dump}.gz
