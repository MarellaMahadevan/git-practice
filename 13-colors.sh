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

dnf list installed git

VALIDATE $? "Listing Git"

 if [ $? -ne 0 ] #if not equal to 0  means 1 or any number we have to install it
 then
    echo "Git is not installed ,going to install it ..."
     dnf install git -y
      VALIDATE $? "Installing Git"
 else #if equal to 0 means true
     echo "Git is Already installed, nothing to do .."
 fi

 dnf list installed mysql

 if [ $? -ne 0 ]
 then
     echo "Mysql is not installed,going to install it..,"
     dnf install mysql -y
     VALIDATE $? "Installing MYSQL"
 else 
     echo "MYSQL is already installed ,nothing to do"
 fi
