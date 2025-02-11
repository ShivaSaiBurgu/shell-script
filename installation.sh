#!/bin/bash
USERTYPE=$(id -u)
if [ $USERTYPE -eq 0 ]
then 
echo "Hello world"
fi