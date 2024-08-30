#!/bin/bash


USERID=$(id -u)
#echo "UserID is : $USERID"

VALIDATE(){
    if [ $? -ne 0 ]
    then 
        echo "$2 is Failed.."
    else 
        echo "$2 is Success.."
    fi
}

if [ $USERID -ne 0 ]
then
    echo "Please run this script with root Previliges"
    exit 1
fi

dnf list installed git

VALIDATE $? "Listing Git"

# if [ $? -ne 0 ] #if not equal to 0  means 1 or any number we have to install it
# then
#     echo "Git is not installed ,going to install it ..."
#     dnf install git -y
      VALIDATE $? "Installing Git"
# else #if equal to 0 means true
#     echo "Git is Already installed, nothing to do .."
# fi

# dnf list installed mysql

# if [ $? -ne 0 ]
# then
#     echo "Mysql is not installed,going to install it..,"
#     dnf install mysql -y
#     VALIDATE $? "Installing MYSQL"
# else 
#     echo "MYSQL is already installed ,nothing to do"
# fi


