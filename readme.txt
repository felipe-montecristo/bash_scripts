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
- Creates a user called `testuser` if it does not already exist.
- Sets a password for `testuser`.
- Adds `testuser` to the sudo group.
- Adds an alias for system updates to `testuser`'s `.bashrc`.
- Sets up a cron job for `testuser` to run system updates weekly.
- Installs `htop` if it is not already installed.

### END
