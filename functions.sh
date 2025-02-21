#!/bin/bash
USERID=$(id-u)
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
}
yum install mysql -y
validate $? "mysql installation"
yum install -y docker
validate $? "docker installation"