#!/bin/bash
USER=$(id -u)
TIME=$(date +%F-%H-%M-%S)
script=$(echo $0 | cut -d "." -f1)
LOGFILE=$TIME-$script.log
if [ $USER -ne 0 ]
then
echo "please run the script with root access"
else
echo "you are a root user"
fi
validate ()
{
    if [ $1 -n 0 ]
    then
    echo "$2....Failure"
    else
    echo "$2....Success"
    fi
}
yum install git -y >>&$LOGFILE
validate $? "Git Installation"
yum install mysql -y >>&$LOGFILE
validate $? "Mysql Installation"
yum install docker -y >>&$LOGFILE
validate $? "Docker Installation"

