#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shellscript-logs"  # ensure shellscript-logs folder to be created
LOG_FILE=$(echo $0 | cut -d "." -f1 )
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

VALIDATE(){

    if [ $? -ne 0 ]
    then # Installation Failure condition applicable
        echo -e " $2  ..... $R FAILURE $N"
        exit 1
    else # Installation Success condition applicable
        echo -e " $2 ..... $G SUCCESS $N"
    fi

}

echo "Script started executing at: $TIMESTAMP" &>>$LOG_FILE_NAME

if [ $USERID -ne 0 ]
then
    echo "ERROR: You must have SUDO access for executing the script"
    exit 1 #Exit since don't have access
fi

dnf list installed mysql -y &>>$LOG_FILE_NAME

if [ $? -ne 0 ]
then
    dnf install mysql &>>$LOG_FILE_NAME
    VALIDATE $? "INSTALLING MYSQL"
else
    echo -e " MYSQL is already ..... $Y INSTALLED $N"
fi

dnf list installed git &>>$LOG_FILE_NAME

if [ $? -ne 0 ]
then
    dnf install git -y &>>$LOG_FILE_NAME
    VALIDATE $? "INSTALLING GIT"
else
    echo -e "GIT is already .... $Y INSTALLED $N"
fi

