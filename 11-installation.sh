#!/bin/bash


USERID=$(id -u)
#echo "UserID is : $USERID"

if [ $USERID -ne 0 ]
then
    echo "Please run this script with root Previliges"
    exit 1
fi

dnf install git -y

