#!/bin/bash
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
validate $? "Mysql installation"