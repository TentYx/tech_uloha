#!/bin/bash

#find and remove files older than 3 days
find "/home/tino/Desktop/example" -mtime +3 -type f -exec rm -fv {} \;

# backup of what files
backup_files="/home/tino/Desktop/uloha"

#where it is going to be stored
dest="/home/tino/Desktop/example"

#name of archive
filename="backup_`date +%Y``date +%m``date +%d`.tar.gz";

#compress of file and move to folder where it is going to be stored
tar cvf /home/tino/Desktop/example/$filename /home/tino/Desktop/uloha/

#move to  backup folder
cd /home/tino/Desktop/example

#list the content
ls

#show disk usage of backup
du -sh

#send on remote host - prerekvizita bola vygenerovanie ssh klucov, ktore boli nasledne vymenene medzi hostami/servermi
rsync -a /home/tino/Desktop/example/$filename tino@192.168.100.4:/home/tino/Desktop/sent
