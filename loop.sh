#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
echo "Please run the script with root access"
exit 1
else
echo "You are a root user"
fi
time=$(date +%F-%H-%M-%S)
script=$(echo $0 | cut -d "." -f1)
LOGFILE=$time-$script.log
validate()
{
    if [ $1 -ne 0 ]
    then
    echo "$2...Failure"
    else
    echo "$2...success"
    fi
}
for i in $@
do
echo "package to install:$i"
yum list installed $i &>>LOGFILE
if [ $? -eq 0 ]
then
echo "$i...Already installed"
else
yum install $i -y &>>LOGFILE
validate $? "$i...Installation of $i"
fi
done