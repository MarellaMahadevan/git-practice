#!/bin/bash

USERID=$(id -u)

if[ $USERID -ne 0 ]
then
    echo "Please run this script with root priviliges"
    exit 1
fi

dnf list installed git

if[ $? -ne 0 ]
then
    echo "Git is not installed,going to install it..,"
    dnf install git -y
    if[ $? -ne 0]
    then 
        echo "git installation is not sucess ,check it"
        exit 1
    else 
        echo "Git installation is success"
else
    echo "Git is already installed,nothing to do"
fi

dnf list installed mysql

if[ $? -ne 0]
then 
    echo "mysql is not installed .... going to install it"
    dnf install mysql -y
    if[ $? -ne 0]
    then 
        echo "mysql installation is failure...please check"
        exit 1
    else
        echo "mysql installation is success"
    fi
else
    echo "mysql already installed nothing to do"
fi
