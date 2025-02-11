#!/bin/bash
a=$1
if [ $a -gt 5 ]
then
echo "a is greater"
else
echo "a is lesser"
fi
b=$2
if [ $b -lt 5 ]
then
echo "b is lesser"
else
echo "b is greater"
fi
c=$3
if [ $c -ge 4 ]
then
echo "c is greater or equal to"
else
echo "c is lesser"
fi
d=$4 
if [ $d -le 5 ]
then
echo "d is lesser or equal to"
else
echo "d is greater"
fi