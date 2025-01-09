#!/bin/bash

#For any software installation, will take care below steps
#Identify the current user have required privileges for the software needs to be installed
#If we install after getting required privileges, then need to cross check Software install status Success or Failure
#Identify the installing software is installed already or not
# If it is already installed then exit/STOP

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "Error:: You must have sudo access to execute the script"
    exit 1 # Program will exit other than 0 i.e., STOP
fi

dnf list installed mysql

if [ $? -ne 0 ] 
then  #not installed
    dnf install mysql -y

    if [ $? -ne 0 ]
    then
        echo "Installing MYSQL .....FAILURE"
        exit 1
    else
        echo "MYSQL installed SUCCESSFULLY"
    fi
else

    echo "MYSQL Software already installed"
fi

#Git Installation
dnf list installed git

if [ $? -ne 0 ]
then
    dnf install git -y
    if [ $? -ne 0 ]
    then   
        echo "Installing GIT ....... FAILURE"
        exit 1
    else
        echo " Installing GIT ............. SUCCESS"
    fi
else
    echo "GIT is already installed"
fi
