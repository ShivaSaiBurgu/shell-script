#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
echo "Please run the script with root user"
exit 1
else
echo "You are a super user"
fi
validate()
{
if [ $1 -ne 0 ]
then 
echo "git not installed successfully"
else
echo "$2"
}
yum install git -y
validate $? installed  git succcessfully