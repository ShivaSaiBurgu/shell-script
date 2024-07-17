#!/bin/bash
echo "Hii, This is shiva"
person1=Ramesh
person2=suresh
echo "$person1:Hii $person2! How are you?"
echo "$person2:Hii $person1! Iam fine! What about you?"
person1=$1
person2=$2
echo "$person1:Hii $person2! How are you?"
echo "$person2:Hii $person1! Iam fine! What about you?"
echo "Please Enter your username:"
read -s USERNAME
echo "Please Enter your password:"
read -s PASSWORD
echo "Entered username is $USERNAME"
echo "Entered password is $PASSWORD"
Movies=("Rebel" "Kalki" "RRR")
echo "The movie is ${Movies[1]}"
echo "The movie is ${Movies[@]}"
NO1=$1
NO2=$2
SUM=$((NO1+NO2))
SUB=$((NO1-NO2))
MUL=$((NO1*NO2))
DIV=$((NO1/NO2))
echo "$SUM"
echo "$SUB"
echo "$MUL"
echo "$DIV"
echo "All variables are: $@"
echo "number of variables given: $#"
echo "file name is : $0"
echo "present working directory is : $PWD"
echo "Home directory is : $HOME"
echo "which user is running this script: $USER"
echo "Hostname: $HOSTNAME"



