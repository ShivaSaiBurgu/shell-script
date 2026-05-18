#!/bin/bash
R="\e[31m"
G="\e[32m"
W="\e[33m"
check_root() {
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
echo "Please run the script with root access"
else
echo "You are a root user"
fi
}
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$TIMESTAMP-$SCRIPT_NAME.log
validate(){
    if [$? -eq 0 ]
    then
    echo -e "$2...$G success $W"
    else
    echo -e "$2...$R Failure $W"
    fi
}