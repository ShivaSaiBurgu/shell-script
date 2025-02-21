#!/bin/bash
Timestamp=$(date +%F-%H-%M-%S)
scriptname=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$scriptname-$Timestamp.log
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
echo "please run the command with super user"
exit 1
else 
echo "You are a super user"
fi
validate()
{
if [ $1 -ne 0 ]
then
echo "$2....Failure"
exit 1
else
echo "$2....success"
fi
}
dnf install mysql -y &>>$LOGFILE
validate $? "mysql installation"
dnf install -y docker &>>$LOGFILE
validate $? "docker installation"