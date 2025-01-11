#!/bin/bash

USERID=$(id -u)

R="\e[31m"
Y="\e[32m"
G="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

VALIDATE(){
    if [ $1 -ne 0 ]
    then #Installation Failure Condition applicable
        echo -e "$2 ..... $R FAILURE $N"
        exit 1
    else
        echo -e "$2 ..... $G SUCCESS $N"
    fi
}

echo " Script started to execute at : $TIMESTAMP" &>>$LOG_FILE_NAME

if [ $USERID -ne 0 ]
then
    echo "ERROR:: You must have SUDO access for execute the script"
    exit 1
fi

for package in $@
do
    dnf list installed $package &>>$LOG_FILE_NAME
    if [ $? -ne 0 ]
    then
        dnf install $package -y &>>$LOG_FILE_NAME
        VALIDATE $? "INSTALLING ... $package"
    else
        echo -e "$package is already .... $Y INSTALLED $N"
    fi
    
done