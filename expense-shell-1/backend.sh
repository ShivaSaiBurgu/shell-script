#!/bin/bash
source ./common.sh
check_root
dnf module disable nodejs -y &>>$LOGFILE
validate $? "Disabling nodejs"
dnf module enable nodejs:20 -y &>>$LOGFILE
validate $? "Enabling nodejs"
dnf install nodejs -y &>>$LOGFILE
validate $? "Installing nodejs"
id expense &>>$LOGFILE
if [ $? -eq 0 ]
then
echo "User Already exists"
else
useradd expense &>>$LOGFILE
validate $? "Added user"
fi
mkdir -p /app &>>$LOGFILE
validate $? "creating /app directory"
curl -o /tmp/backend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-backend-v2.zip &>>$LOGFILE
validate $? "Downloading Code"
cd /app
rm -rf /app/*
unzip /tmp/backend.zip &>>$LOGFILE
validate  $? "unzipping code"
npm install &>>$LOGFILE
validate $? "Installing nodejs dependencies"
cp /home/ec2-user/shell-script/backend.service /etc/systemd/system/backend.service &>>$LOGFILE
validate $? "copied backend.service"
systemctl daemon-reload &>>$LOGFILE
validate $? "daemon reload"
systemctl start backend &>>$LOGFILE
validate $? "starting backend"
systemctl enable backend &>>$LOGFILE
validate $? "enabling backend"
dnf install mysql -y &>>$LOGFILE
validate $? "Installing mysql client"
echo "Please enter mysql password"
read -s PASSWORD
mysql -h db.burgu.online -uroot -p${PASSWORD} < /app/schema/backend.sql
validate $? "schema loading"
systemctl restart backend
validate $? "restarting backend"
