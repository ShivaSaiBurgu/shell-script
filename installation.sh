#!/bin/bash
USERTYPE=$(id -u)
if [ $USERTYPE != 0 ]
then
exit 1
fi
echo "Hii"