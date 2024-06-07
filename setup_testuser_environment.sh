#!/bin/bash

CRON_JOB="0 3 * * 7 update_sys"
user="testuser"

#start the script only as ROOT
if [ "$(id -u)" -ne 0 ];then
	echo "this script has to be run as ROOT"
	exit 1
fi

#create user "testuser" if does not exist
if ! grep -q "^$user:" /etc/passwd; then
	useradd -m -s /bin/bash $user
	echo "the user '$user' was created"
	
	#create password for testuser
	echo "$user:password" | chpasswd
		if [ $? -eq 0 ];then
			echo "password for '$user' was created"
		else
			echo "an error occurred while creating the password for '$user'."
		fi
	#add testuser to sudo group	
	usermod -aG sudo $user
		if [ $? -eq 0 ];then
			echo "user '$user' was added to sudo group"
		else
			echo "an error occurred while adding '$user' to sudo group"
		fi
	
	#create update_sys alias and add it to .bashrc	
	echo "alias update_sys='sudo apt update && sudo apt upgrade -y'" >> /home/$user/.bashrc
	su - $user  -c "source ~/.bashrc"
	if [ $? -eq 0 ];then
			
			echo "alias update_sys for '$user' was created"
		else
			echo "an error occurred while creating alias update_sys for '$user'"
		fi
	
	#create cronjob for automatic system update	
	echo "$CRON_JOB" | crontab -u $user -
		if [ $? -eq 0 ];then
			echo "cronjob for '$user' was created"
		else
			echo "an error occurred while creating cronjob for '$user'"
		fi
		
	#install htop	
	if ! command -v htop &> /dev/null ;then
		apt install -y htop &> /dev/null
		if [ $? -eq 0 ];then
			echo "htop was installed"
		else
			echo "an error occurred while installing htop"
		fi
	else
		echo "htop is already installed"
	fi
	
else	echo "the user '$user' already exists"
fi 
