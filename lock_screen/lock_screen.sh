#!/bin/bash
#This is the script for the lock_screen command, located under /usr/share/applications/lock_screen.sh
#Aliased in ~/.bash_aliases
#Working under Kubuntu 15.10 (KDE Plasma 5)
qdbus org.freedesktop.ScreenSaver /ScreenSaver Lock
sleep 3
xset dpms force off
