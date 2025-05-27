#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

validate_install() {
        
    if [ "$1" -eq 0 ]; then
        echo -e "$G $2 installed successfully $N"
    else
        echo "$R $2 installation failed $N"
        exit 1

    fi    
}

USERID=$(id -u)

if [ "$USERID" -eq 0 ]; then
    echo "You are running the script with root access"
else
    echo "$R custErr:You need admin access to run this script $N"
    exit 1
fi


dnf list installed mysql

if [ $? -eq 0 ]; then
    echo "$Y MySql is already installed on this system $N"
else
    echo "MySql is not installed on this system, proceeding to install"
    dnf install mysql -y
    VALIDATE $? "mysql"
fi

dnf list installed python3

if [ $? -eq 0 ]; then
    echo "$Y Python is already installed on this system $N"
else
    echo "Python is not installed on this system, proceeding to install"
    dnf install python3 -y
    VALIDATE $? "python"
fi

dnf list installed nginx

if [ $? -eq 0 ]; then
    echo "$Y nginx is already installed on this system $N"
else
    echo "nginx is not installed on this system, proceeding to install"
    dnf install nginx -y
    VALIDATE $? "nginx"
fi


