#!/bin/bash
time=$(date +%F-%H-%M-%S)
script=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$time-$script.log
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
echo "please enter the script with root access"
exit 1
else
echo "You are a root user"
fi
echo "please enter mysql root password"
read -s MYSQLPWD

validate()
{
    if [ $1 -ne 0 ]
    then
    echo "$2...Failure"
    exit 1
    else
    echo "$2...success"
    fi
}
dnf install mysql-server -y &>>$LOGFILE
validate $? "Installation of mysql"
systemctl start mysqld &>>$LOGFILE
validate $? "starting mysql server"
systemctl enable mysqld &>>$LOGFILE
validate $? "Enabling mysql server"
mysql -h db.burgu.space -uroot -p${MYSQLPWD} -e 'SHOW DATABASES;' &>>LOGFILE
if [ $? -eq 0 ]
then
echo "Mysql Root Password Already setup"
else
 mysql_secure_installation --set-root-pass ${MYSQLPWD} &>>$LOGFILE
 validate $? "Mysql password set up"
 fi




