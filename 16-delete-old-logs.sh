#!/bin/bash

R="\e[31m"
Y="\e[32m"
G="\e[33m"
N="\e[0m"


SOURCE_DIR="/home/ec-user/app-logs"

LOGS_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

echo -e "Script started to execute at : $Y $TIMESTAMP $N" &>>$LOG_FILE_NAME

mkdir -p "/home/ec-user/app-logs"

FILES_TO_DELETE=$(find $SOURCE_DIR -name "*.log" -mtime +14)
echo "FILES to be deleted: $FILES_TO_DELETE"

while read -r filepath  # filepath is the variable name, we can give any name 
do
    echo "DELETING the files: $filepath" &>>$LOG_FILE_NAME

    echo "DELETED the files: $filepath"
    
done <<< $FILES_TO_DELETE


