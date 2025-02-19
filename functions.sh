#!/bin/bash
USER=$(id-u)
if [ $USER -ne 0 ]
then
echo "please run the command with super user"
exit 1
else dnf install mysql -y
fi