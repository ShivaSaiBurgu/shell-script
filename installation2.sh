#!/bin/bash
USERTYPE=$(id -u)
if [ $USERTYPE -ne 0 ]
then
sudo su
yum install mysql -y
if [ $? -ne 0 ]
then
echo "mysql not installed successfully"
exit 1
fi
echo "Installation completed successfully"