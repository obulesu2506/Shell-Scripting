#!/bin/bash

R="\e[31m"
Y="\e[32m"
G="\e[33m"
N="\e[0m"

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} #If User doesn't provide number of days input then by defauly system will ocnsider 14 days

LOGS_FOLDER="/home/ec2-user/shellscript-logs"
LOG_FILE=$(echo $0 | awk -F "/" '{print $NF}' | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

USAGE(){
    echo -e "$R USAGE :: $N backup <SOURCE DIR> <DEST DIR> <DAYS(optional)>"
    exit 1 #
}

mkdir -p /home/ec2-user/shellscript.logs

if [ $# -lt 2 ]
then
    USAGE
fi

if [ ! -d "$SOURCE_DIR" ]
then
    echo -e "$R $SOURCE_DIR $N does not exists.... Please check"
    exit 1 # other than 0 for return in case if the condition is failure
fi

if [ ! -d "$DEST_DIR" ]
then
    echo -e "$R $DEST_DIR $N does not exists ..... Please check"
    exit 1 # other than 0 for return in case if the condition is failure
fi

echo  "Script started to executing at :: $TIMESTAMP" &>>$LOG_FILE_NAME

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +$DAYS)

if [ -n "$FILES" ] # True if there are any files to ZIP
then
    echo -e " FILES are: $G $FILES $N" &>>$LOG_FILE_NAME
    ZIP_FILE="$DEST_DIR/app-logs-$TIMESTAMP.ZIP"
    find $SOURCE_DIR -name "*.log" -mtime +$DAYS | zip -@ "$ZIP_FILE"
    if [ -f "$ZIP_FILE" ]
    then
        echo -e "Successfully created zip file for the files older than $G $DAYS $N"
        while read -r filepath # filepath is the variable and can give any name/variable
        do
            echo "Deleting the files: $Y $filepath $N" &>>$LOG_FILE_NAME
            rm -rf $filepath
            echo "Deleted the file: $G $filepath $N"

        done <<< $FILES
    else
        echo -e "$R Error :: $N Failed to Create th ZIP File" &>>$LOG_FILE_NAME
    fi    
else
    echo -e "No files found older than the $Y $DAYS $N"
fi