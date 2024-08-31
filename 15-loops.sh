#!/bin/bash

USERID=$(id -u)
#echo "UserID is : $USERID"

R="\e[31m"
G="\e[32m"
N="\e[0m"

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo "Please run this script with root Previliges"
        exit 1
    fi
}

VALIDATE(){
    if [ $? -ne 0 ]
    then 
        echo -e "$2 is  $R Failed.. $N"
    else 
        echo -e "$2 is $G Success.. $N"
    fi
}

CHECK_ROOT

#sh 15-loops.sh git mysql postfix nginx
for package in $@ #$@ refers to all arguments to pass it
do
    echo "output: $package"
done