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
yum list installed $i
if [ $? -eq 0 ]
then
echo "$i already installed...skipping"
else
echo "$i not installed....need to install"
fi
done
