#!/bin/bash

##############################################################################
#									     	#
#  Crontab configuration:  00 12 * * * /home/tino/Desktop/uloha/backup.sh	#
#									     	#
##############################################################################

#vars
home_dir=/home/tino/Desktop
dest="$home_dir/example"
filename="backup_`date +%Y``date +%m``date +%d`.tar.gz";


# backup of what files
# backup_files="/home/tino/Desktop/uloha"

#read from cfg file
source $home_dir/script/folder_set.config

#compress of file and move to folder where it is going to be stored
tar cvf $home_dir/example/$filename $home_dir/uloha/

#move to  backup folder
cd $home_dir/example

#list the content
ls

#send on remote host - prerekvizita bola vygenerovanie ssh klucov, ktore boli nasledne vymenene medzi hostami/servermi
rsync -av -e "ssh -i $HOME/.ssh/my_key" $home_dir/example/$filename tino@192.168.100.4:$home_dir/sent

#find and remove files older than 3 days
find "$home_dir/example" -mtime +3 -type f -exec rm -fv {} \;
