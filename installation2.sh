#!/bin/bash
USERTYPE=$(id -u)
if [ $USERTYPE -ne 0 ]
then
sudo su
sudo apt install mysql-server
if [ $? -ne 0 ]
then
echo "mysql not installed successfully"
exit 1
fi
echo "Installation completed successfully"
fi