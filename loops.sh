#!/bin/bash
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
    echo "$2....success"
    else
    echo "$2....Failure"
    fi
}
for i in $@
do
echo "packages to install: $i"
yum list installed $i
if [ $? -eq 0 ]
then
echo "$i already installed...skipping"
else
yum install $i
validate $? "Installation of $i"
fi
done
