USERID=$(id -u)
if [ $USERID -ne 0 ]
then
echo "Please run this script using root access"
exit 1
else
echo "You are a root user"
fi
validate(){
if [ $1 -ne 0 ]
then
echo "$2...Failure"
else
echo "$2...success"
}
dnf install mysql -y
validate $? "Installing mysql"
dnf install git -y
validate $? "Installing git"
