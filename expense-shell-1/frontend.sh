#!/bin/bash
source ./common.sh
check_root
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
cp /home/ec2-user/shell-script/expense.conf /etc/nginx/default.d/expense.conf &>>$LOGFILE
validate $? "copying expen"
systemctl restart nginx &>>$LOGFILE
validate $? "Restarting nginx"