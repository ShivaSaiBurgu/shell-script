#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
echo "please run the script with root user access"
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
yum install git -y
validate $? "git installation"
yum install mysql -y
validate $? "mysql installation"
yum install docker -y
validate $? "docker installation"