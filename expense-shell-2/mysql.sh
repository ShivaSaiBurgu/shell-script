#!/bin/bash
source ./common.sh
check_root
dnf install mysql-server -y
validate $? "Installation of mysql"
systemctl enable mysqld
validate $? "Enabling of mysql"
systemctl start mysqld
validate $? "Starting of mysql"

