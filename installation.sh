#!/bin/bash
USERTYPE=$(id -u)
if [ $USERTYPE -eq 0]
exit 1
then 
echo "Hello world"
fi