#!/bin/bash
#This incrementally snapshots / (not crossing filesystem boundaries) via rsync
#Has to be run as root to be effective
#use -q to shut the prompt up without ignoring errors (if trying to crontab)
#Figure out how to do gui prompt with crontab first before crontabbing this one


#copy old time.txt to time2.txt

yes | cp /deepstorage/RootBackups/time.txt /deepstorage/RootBackups/time2.txt

#overwrite old time.txt file with new time

echo `date +”%F-%I%p”` > /deepstorage/RootBackups/time.txt

#make the log file

echo “” > /deepstorage/RootBackups/rsync-`cat /deepstorage/RootBackups/time.txt`.log

#rsync command

rsync -avhzxAXPR --chmod=Du=rwx,Dgo=rx,Fu=rw,Fgo=r --delete --super --stats --log-file=/deepstorage/RootBackups/rsync-`cat /deepstorage/RootBackups/time.txt`.log --exclude-from ~/Scripts/rsync_snapshot/rsync_snapshot_exclude.txt --link-dest=/deepstorage/RootBackups/`cat /deepstorage/RootBackups/time2.txt` / /deepstorage/RootBackups/`cat /deepstorage/RootBackups/time.txt`

#don’t forget to scp the log file and put it with the backup (just mv the one earlier into the rsync snapshot's root)

mv /deepstorage/RootBackups/rsync-`cat /deepstorage/RootBackups/time.txt`.log /deepstorage/RootBackups/`cat /deepstorage/RootBackups/time.txt`
