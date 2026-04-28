#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
echo "Please run the script with root access"
exit 1
else
echo "You are a super user"
fi
R="\e[32m"
W="\e[0m"
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$TIMESTAMP-$SCRIPT_NAME
validate() {
if [ $1 -ne 0 ]
then
echo -e "$2... $R failure $W"
exit 1
else
echo -e "$2... $R success $W"
fi
}
dnf install mysql -y &>> $LOGFILE
validate $? "Installion of Mysql"
dnf install git -y &>> $LOGFILE
validate $? "Installaion of git"
dnf install dockerr -y &>> $LOGFILE
validate $? "Installation of Docker"
