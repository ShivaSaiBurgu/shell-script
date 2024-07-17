#!/bin/bash
NUM1=$1
NUM2=$2
SUM=$((NUM1+NUM2))
if [ $SUM == 500 ]
then
echo "Hii"
else
echo "Bye"
fi