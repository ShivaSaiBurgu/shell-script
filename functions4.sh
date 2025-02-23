#!/bin/bash
Timestamp=$(date +%F-%H-%M-%S)
script=$(echo $0 | cut -d "." -f1)
logfile=/tmp/$Timestamp-$script.log
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
echo "please run the script with root user access"
exit 1
else
echo "you are a root user"
fi
validate()
{
if [ $? -ne 0 ]
then
echo "$2...Failure"
exit 1
else
echo "$2...success"
fi
}
yum install git -y &>>$logfile
validate $? "git installation"
yum install mysql -y &>>$logfile
validate $? "mysql installation"
yum install docker -y &>>$logfile
validate $? "docker installation"