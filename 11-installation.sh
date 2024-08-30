#!/bin/bash


USERID=$(id -u)
#echo "UserID is : $USERID"

if [ $USERID -ne 0 ]
then
    echo "Please run this script with root Previliges"
    exit 1
fi

dnf list installed gittt

if [ $? -ne 0 ] #if not equal to 0  means 1 or any number we have to install it
then
    echo "Git is not installed ,going to install it ..."
    dnf install gittt -y
    if [ $? -ne 0 ]
    then 
        echo "Git installation is not success ,check it"
    else
        echo "Git installation is success"
    fi
else #if equal to 0 means true
    echo "Git is Already installed, nothing to do .."
fi

