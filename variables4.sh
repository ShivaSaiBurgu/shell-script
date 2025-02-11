#!/bin/bash
PERSON1=Ramesh
PERSON2=Suresh
echo "$PERSON1 and $PERSON2"
PERSON3=$1
PERSON4=$2
echo "$PERSON3 and $PERSON4"
echo "Please Enter your Username:"
read USERNAME
echo "Please enter your password:"
read PASSWORD
echo "The Details are $USERNAME and $PASSWORD"
echo "Please Enter your Country"
read -s COUNTRY
echo "Please Enter your state"
read -s STATE
echo "Your details are $COUNTRY and $STATE"
