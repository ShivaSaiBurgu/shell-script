USERID=$(id -u)
if [ $USERID -ne 0 ]
then
echo "Please run the script with root Access"
exit 1
else
echo "You are a root user"
fi
time=$(date +%F-%H-%M-%S)
script=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$time-$script.log
VALIDATE()
{
    if [ $? -ne 0 ]
    then
    echo "$1...Failure"
    else
    echo "$2...success"
    fi
}
dnf module disable nodejs -y &>>$LOGFILE
VALIDATE $? "Disabling node js"
dnf module enable nodejs:20 -y &>>$LOGFILE
VALIDATE $? "Enabling nodejs"
dnf install nodejs -y &>>$LOGFILE
VALIDATE $? "Installing nodejs" 
id expense &>>$LOGFILE
if [ $? -eq 0 ]
then
echo "User already exists"
else
useradd expense &>>$LOGFILE
VALIDATE $? "user added"
fi
mkdir -p /app &>>$LOGFILE
VALIDATE $? "/app directory created"
curl -o /tmp/backend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-backend-v2.zip &>>$LOGFILE
VALIDATE $? "Downloaded code"
cd /app
rm -rf /app/*
unzip /tmp/backend.zip &>>$LOGFILE
VALIDATE $? "extracted code successfully"
cd /app
npm install &>>$LOGFILE
VALIDATE $? "Installing Depedencies"
cp /home/ec2-user/shell-script/backend.service /etc/systemd/system/backend.service &>>$LOGFILE
VALIDATE $? "created backend.service"
