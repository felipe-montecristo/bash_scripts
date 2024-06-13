#!/bin/bash

if [ $(id -u) -ne 0 ];then
	echo "Das Skript muss als ROOT ausgeführt werden."
	exit 1
fi

namensliste="/home/felipe/Desktop/namensliste.txt"
success_log="/home/felipe/Desktop/success_log"
error_log="/home/felipe/Desktop/error_log"
datum=$(date +%d.%m.%Y-%H:%Mh:) 

for name in $(cat $namensliste)
do
	useradd -m -s /bin/bash $name > /dev/null 2>&1
	if [ $? -eq 0 ];then
		echo "$datum Der Benutzer $name wurde erfolgreich erstellt." >> $success_log
	else
		echo "$datum Es ist ein Fehler bei der Anlegen des Benutzers $name aufgetreten." >> $error_log
	fi

	echo "$name:123" |  chpasswd > /dev/null 2>&1
	if [ $? -eq 0 ];then
		echo "$datum Es wurde ein Passwort für $name erstellt." >> $success_log
	else
		echo "$datum Es konnte kein Passwort für $name erstellt werden." >> $error_log
	fi
	
	echo "alias cls=clear" >> /home/$name/.bashrc > /dev/null 2>&1
	su - $name -c "source /home/$name/.bashrc"
	if [ $? -eq 0 ];then
		echo "$datum Das Alias 'cls' für $name wurde erfolgreich hinzugefügt." >> $success_log
	else
		echo "$datum Das Alias 'cls' konnte nicht für $name hinzugefügt werden." >> $error_log
	fi
	
	echo "Willkommen $name!" >> /home/$name/willkommen.txt > /dev/null 2>&1
	if [ $? -eq 0 ];then
		echo -e "$datum Es wurde eine Willkommensdatei für $name erstellt.\n" >> $success_log
	else
		echo "$datum Es konnte keine Willkommensdatei für $name erstellt werden." >> $error_log
	fi
done
