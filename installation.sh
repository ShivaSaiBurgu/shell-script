#!/bin/bash
USERTYPE=$(id -u)
if [ $USERTYPE != 0 ]
then
sudo su
fi