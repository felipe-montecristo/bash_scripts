# Bash Scripts

Welcome to the **Bash Scripts** repository! This repository contains a collection of useful Bash scripts for various system administration tasks and automations.

## Table of Contents

- [Introduction](#introduction)
- [Scripts](#scripts)

## Introduction

This repository is designed to provide a variety of Bash scripts that can help with system administration, automation, and other common tasks. Whether you're looking to automate updates, manage users, or perform other system tasks, you'll find useful scripts here.

## Scripts

### 1. create_testuser_and_setup.sh

This script:
- Creates a user called 'testuser'.
- Sets a password for 'testuser'.
- Adds 'testuser' to the sudo group.
- Adds an alias for system updates to 'testusers' '.bashrc'.
- Sets up a cron job for 'testuser' to run system updates weekly.
- Installs 'htop' if it is not already installed.

### 2. backup.sh

This script:
- Checks if exactly two arguments are provided.
- Validates that rsync is installed.
- Captures the current date in the format DD-MM-YYYY.
- Creates necessary backup directories.
- Sets rsync options for archiving, verbose output, creating backups, specifying a backup directory, deleting files, and performing a dry run.
- Executes the rsync command with these options to synchronize files.
- Logs the output to a file named with the current date.

### END
