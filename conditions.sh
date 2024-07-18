#!/bin/bash
NUM1=$1
NUM2=$2

if [ $NUM1 -ge $NUM2 ]
then
echo "sunday"
elif [ $NUM1 -le $NUM2]
then
echo "Monday"
elif [ $NUM1 -ne $NUM2]
then
echo "Tuesday"
fi
