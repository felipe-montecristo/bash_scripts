#!/bin/bash

if [ $(id -u) -ne 0 ];then
	echo "Das Skript muss als ROOT ausgeführt werden:"
	exit 1
fi

namensliste="/home/felipe/Desktop/namensliste.txt"
success_log="/home/felipe/Desktop/success_log"
datum=$(date +%d.%m.%Y-%H:%Mh:) 

for name in $(cat $namensliste)
do
	userdel -r $name > /dev/null 2>&1
	echo "$datum Der Benutzer $name wurde erfolgreich gelöscht." >> $success_log 
done


