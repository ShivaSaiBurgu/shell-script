#!/bin/bash
TIME=$(date +%f-%H-%M-%S)
script=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$TIME-$script.log
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
echo "please run the script with use access"
exit 1
else
echo "you are a root user"
fi
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
yum install mysql -y
validate $? "Mysql installation"