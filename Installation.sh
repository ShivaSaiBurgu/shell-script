#!/bin/bash
USERID=$(id -u)
if [$id -ne 0]
then 
echo "Please run the script using root access"
exit 1
else
echo "You are a root user"
