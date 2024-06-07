#!/bin/bash

CRON_JOB="0 3 * * 7 update_sys"

#start the script only if ROOT
if [ "$(id -u)" -ne 0 ];then
	echo "This script has to be run as ROOT."
	exit
fi

#create user "testuser" if does not exist
if ! grep -q "^testuser:" /etc/passwd; then
	useradd -m -s /bin/bash testuser
	echo "The user 'testuser' was created."
	
	#create password for testuser
	echo "testuser:password" | chpasswd
		if [ $? -eq 0 ];then
			echo "Password for 'testuser' was created"
		else
			echo "An error occurred while creating the password for 'testuser'."
		fi
	#add testuser so sudo group	
	usermod -aG sudo testuser
		if [ $? -eq 0 ];then
			echo "User 'testuser' was added to sudo group."
		else
			echo "En error occurred while adding 'testuser' to sudo group."
		fi
	
	#create update_sys alias and add it to .bashrc	
	echo "alias update_sys='sudo apt update && sudo apt upgrade -y'" >> /home/testuser/.bashrc
	su - testuser  -c "source .bashrc"
	if [ $? -eq 0 ];then
			
			echo "Alias update_sys for 'testuser' was created."
		else
			echo "En error occurred while creating alias update_sys for 'testuser'."
		fi
	
	#create cronjob for automatic system update	
	(crontab -u testuser -l 2> /dev/null; echo "$CRON_JOB") | crontab -u testuser -
		if [ $? -eq 0 ];then
			echo "Cronjob for 'testuser' was created."
		else
			echo "En error occurred while creating cronjob for 'testuser'."
		fi
		
	#install htop	
	if ! command -v htop &> /dev/null ;then
		apt install htop &> /dev/null
		echo "htop was installed"
	else
		echo "htop is already installed"
	fi
	
else	echo "The user 'testuser' already exists."
fi 
