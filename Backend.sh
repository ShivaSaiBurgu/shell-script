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
dnf install nodejs -y
VALIDATE $? "Installing nodejs" &>>$LOGFILE
id expense
if [ $? -eq 0 ]
then
echo "User already exists"
else
useradd expense &>>$LOGFILE
VALIDATE $? "user added"
fi
