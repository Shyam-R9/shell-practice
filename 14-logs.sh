#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOG_FOLDER=/var/logs/shellscripts-logs
SCRIPT_NAME=$($0 | cut -d "." -f1)
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOG_FOLDER
echo "Script execution started at: $(date)" >> $LOG_FILE

validate_install() {
        
    if [ "$1" -eq 0 ]; then
        echo -e "$G $2 installed successfully $N" >> $LOG_FILE
    else
        echo -e "$R $2 installation failed $N" >> $LOG_FILE
        exit 1

    fi    
}

USERID=$(id -u)

if [ "$USERID" -eq 0 ]; then
    echo "You are running the script with root access" >> $LOG_FILE
else
    echo -e "$R custErr:You need admin access to run this script $N" >> $LOG_FILE
    exit 1
fi


dnf list installed mysql

if [ $? -eq 0 ]; then
    echo -e "$Y MySql is already installed on this system $N" >> $LOG_FILE
else
    echo "MySql is not installed on this system, proceeding to install" >> $LOG_FILE
    dnf install mysql -y
    validate_install $? "mysql"
fi

dnf list installed python3

if [ $? -eq 0 ]; then
    echo -e "$Y Python is already installed on this system $N" >> $LOG_FILE
else
    echo "Python is not installed on this system, proceeding to install" >> $LOG_FILE
    dnf install python3 -y
    validate_install $? "python"
fi

dnf list installed nginx

if [ $? -eq 0 ]; then
    echo -e "$Y nginx is already installed on this system $N" >> $LOG_FILE
else
    echo "nginx is not installed on this system, proceeding to install" >> $LOG_FILE
    dnf install nginx -y
    validate_install $? "nginx"
fi


