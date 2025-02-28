#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
exit 1
echo "please run the script with root user access"
else
echo "you are a root user"
fi
for i in $@
do
echo "packages to install: $i"
done
