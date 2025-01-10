#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"

VALIDATE(){
    if [ $1 -ne 0 ]
    then #Failure Condition applicable
        echo -e "$2 ..... $R FAILURE"
        exit 1
    else  #Success Condition applicable
        echo -e "$2 ..... $G SUCCESS"
    fi
}

if [ $USERID -ne 0 ]
then
    echo "ERROR:: You must have SUDO access to execute the script"
    exit 1 #other than 0
fi

dnf list installed mysql

if [ $? -ne 0 ]
then # Not Installed Condition applicable
    dnf install mysql -y
    VALIDATE $? "Installing MYSQL"
else # Installed Condition applicable
    echo -e "MYSQL is already ...... $Y INSTALLED"
fi


dnf list installed git

if [ $? -ne 0 ]
then # Not Installed Condition Applicable
    dnf install git -y
    VALIDATE $? " Installing GIT "
else # Already Installed condition applicable
    echo -e " GIT is already .... $Y INSTALLED"
fi


