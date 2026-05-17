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
