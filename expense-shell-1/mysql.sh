#!/bin/bash
source ./common.sh
check_root
dnf install mysql-server -y &>>$LOGFILE
validate $? "Installation of mysql"
systemctl enable mysqld &>>$LOGFILE
validate $? "Enabling mysql"
systemctl start mysqld &>>$LOGFILE
validate $? "Starting mysql"
echo "Please enter mysql password"
read -s PASSWORD
mysql -h db.burgu.online -uroot -p${PASSWORD} -e "SHOW DATABASES;" &>>$LOGFILE
if [ $? -eq 0 ]
then
echo "Password already set up"
else
mysql_secure_installation --set-root-pass ${PASSWORD}
validate $? "mysql root password setup"
fi
