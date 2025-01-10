#!/bin/bash

USERID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 .... FAILURE"
        exit 1
    else
        echo "$2 ..... SUCCESS"
    fi
}

if [ $USERID -ne 0 ]
then
    echo "Error:: You must have SUDO access to execute the script"
    exit 1 # Need to mention other than 0 if its Failure
fi

dnf list installed mysql

if [ $? -ne 0 ]
then #not installed condition applicable
    dnf install mysql -y
    VALIDATE $? "INSTALLING MYSQL"
else #Already installed condition applicable
    echo "MYSQL is already............ Installed"
fi

dnf list installed git

if [ $? -ne 0 ]
then #Not Installed condition applicable
    dnf install git -y
    VALIDATE $? "INSTALLING GIT"
else # Already installed condition applicable
    echo " GIT is already..... Installed"
fi
