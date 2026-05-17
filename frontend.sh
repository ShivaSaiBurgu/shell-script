#!/bin/bash
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$TIMESTAMP-$SCRIPT_NAME.log
R="\e[31m"
G="\e[32m"
W="\e[0m"
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
echo "Please run the script with root user access"
else
echo "You are a root user"
fi
validate() {
    if [ $? -ne 0 ]
    then
    echo -e "$2...$R Failure $W"
    else
    echo -e "$2...$G success $W"
    fi
}
dnf install nginx -y &>>$LOGFILE
validate $? "Installation of nginx"
systemctl enable nginx &>>$LOGFILE
validate $? "Enabling nginx"
systemctl start nginx &>>$LOGFILE
validate $? "starting nginx"
rm -rf /usr/share/nginx/html/* &>>$LOGFILE
validate $? "Removing older content in html"
curl -o /tmp/frontend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-frontend-v2.zip &>>$LOGFILE
validate $? "Downloading frontend code"
cd /usr/share/nginx/html 
unzip /tmp/frontend.zip &>>$LOGFILE
validate $? "unzipping code"
cp home/ec2-user/shell-script/expense.conf /etc/nginx/default.d/expense.conf &>>$LOGFILE
validate $? "copying expen"
systemctl restart nginx &>>$LOGFILE
validate $? "Restarting nginx"