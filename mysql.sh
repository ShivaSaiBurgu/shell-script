#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
echo "Please run the script with root Access"
exit 1
else
echo "You are a root user"
fi
echo "please enter the mysql password"
read -s PWD
time=$(date +%F-%H-%M-%S)
script=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$time-$script.log
VALIDATE()
{
    if [ $? -ne 0 ]
    then
    echo "$1...Failure"
    else
    echo "$2...success"
    fi
}
yum install mysql-server -y &>>$LOGFILE
VALIDATE $? "Installing mysql"
systemctl enable mysqld &>>$LOGFILE
VALIDATE $? "Enabling mysql"
systemctl start mysqld &>>$LOGFILE
VALIDATE $? "Starting mysql"
mysql -h db.burgu.space -uroot -p${PWD} -e 'show databases;' &>>$LOGFILE
if [ $? -ne 0 ]
then
mysql_secure_installation --set-root-pass ${PWD}
VALIDATE $? "password setup" 
else
echo "password already set up"
fi





