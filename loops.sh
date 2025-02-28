#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
echo "please run the script with root user access"
exit 1
else
echo "you are a root user"
fi
for i in $@
do
echo "packages to install: $i"
dnf list installed $i
done
