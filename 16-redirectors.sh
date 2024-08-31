#!/bin/bash

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p $LOGS_FOLDER


USERID=$(id -u)
#echo "UserID is : $USERID"

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo "$R Please run this script with root Previliges $N" $>>$LOG_FILE
        exit 1
    fi
}

VALIDATE(){
    if [ $? -ne 0 ]
    then 
        echo -e "$2 is  $R Failed.. $N"$>>$LOG_FILE
    else 
        echo -e "$2 is $G Success.. $N"$>>$LOG_FILE
    fi
} 

USAGE(){
    echo "USAGE :: sudo sh 16-redirectors.sh package1 package2"
    exit 1
}

CHECK_ROOT

if[ $# -eq 0 ]
then
    USAGE
fi

for package in $@ #$@ refers to all arguments to pass it
do
    dnf list installed $package$>>$LOG_FILE
    if [ $? -ne 0 ]
    then    
        echo "$package is not installed, going to install it..."$>>$LOG_FILE
        dnf install $package -y$>>$LOG_FILE
        VALIDATE $? "Installing $package"$>>$LOG_FILE
    else    
        echo "$package is already $Y installed , nothing to do $N..."$>>$LOG_FILE
    fi
done