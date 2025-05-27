#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOG_FOLDER=/var/log/shellscripts-logs
mkdir -p $LOG_FOLDER
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME.log"

validate_install() {
        
    if [ "$1" -eq 0 ]; then
        echo -e "$G $2 installed successfully $N" | tee -a $LOG_FILE
    else
        echo -e "$R $2 installation failed $N" | tee -a $LOG_FILE 2>&1
        exit 1

    fi    
}



USERID=$(id -u)

if [ "$USERID" -eq 0 ]; then
    echo "You are running the script with root access" | tee -a $LOG_FILE
else
    echo -e "$R custErr:You need admin access to run this script $N" | tee -a $LOG_FILE 2>&1
    exit 1
fi


echo "Script execution started at: $(date)" | tee -a $LOG_FILE

dnf list installed mysql | tee -a $LOG_FILE

if [ $? -eq 0 ]; then
    echo -e "$Y MySql is already installed on this system $N" | tee -a $LOG_FILE
else
    echo "MySql is not installed on this system, proceeding to install" | tee -a $LOG_FILE 
    dnf install mysql -y | tee -a $LOG_FILE
    validate_install $? "mysql"
fi

dnf list installed python3 | tee -a $LOG_FILE

if [ $? -eq 0 ]; then
    echo -e "$Y Python is already installed on this system $N" | tee -a $LOG_FILE
else
    echo "Python is not installed on this system, proceeding to install" | tee -a $LOG_FILE
    dnf install python3 -y | tee -a $LOG_FILE
    validate_install $? "python"
fi

dnf list installed nginx

if [ $? -eq 0 ]; then
    echo -e "$Y nginx is already installed on this system $N" | tee -a $LOG_FILE
else
    echo "nginx is not installed on this system, proceeding to install" | tee -a $LOG_FILE
    dnf install nginx -y | tee -a $LOG_FILE
    validate_install $? "nginx"
fi
echo "-----------------------------------------------------------------------------------" | tee -a $LOG_FILE

