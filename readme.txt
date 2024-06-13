# Bash Scripts

Welcome to the **Bash Scripts** repository! This repository contains a collection of useful Bash scripts for various system administration tasks and automations.

## Table of Contents

- [Introduction](#introduction)
- [Scripts](#scripts)

## Introduction

This repository is designed to provide a variety of Bash scripts that can help with system administration, automation, and other common tasks. Whether you're looking to automate updates, manage users, or perform other system tasks, you'll find useful scripts here.

## Scripts

### 1.create_testuser_and_setup_environment.sh
This script:
- Creates a user called 'testuser'.
- Sets a password for 'testuser'.
- Adds 'testuser' to the sudo group.
- Adds an alias for system updates to 'testusers' '.bashrc'.
- Sets up a cron job for 'testuser' to run system updates weekly.
- Installs 'htop' if it is not already installed.

### 2.backup.sh
This script:
- Checks if exactly two arguments are provided (backup directory + target directory)
- Validates that rsync is installed.
- Creates necessary backup directories.
- Sets rsync options for archiving, verbose output, creating backups, specifying a backup directory, deleting files, and performing a dry run.
- Executes the rsync command with these options to synchronize files.
- Logs the output to a file named with the current date.

### 3.bulk_create_users.sh
This script:
- Loops through each name in a list and creates:
	- user
	- password
	- alias 'cls=clear'
	- welcomefile in home directory

### 4.bulk_delete_users.sh
This script:
- Loops trough each name in a list and deletes the user and his home directory.

### END
