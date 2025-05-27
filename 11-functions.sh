#!/bin/bash

USERID=$(id -u)

if [ "$USERID" -eq 0 ]; then
    echo "You are running the script with root access"
else
    echo "custErr:You need admin access to run this script"
    exit 1
fi

VALIDATE() {
        
    if [ $1 -eq 0 ]; then
        echo "$2 installed successfully"
    else
        echo "$2 installation failed"
        exit 1

    fi    
}
dnf list installed mysql

if [ $? -eq 0 ]; then
    echo "MySql is already installed on this system"
    exit 0
else
    echo "MySql is not installed on this system, proceeding to install"
    dnf install mysql -y
    VALIDATE $? "mysql"
fi

dnf list installed python3

if [ $? -eq 0 ]; then
    echo "Python is already installed on this system"
else
    dnf install python3
    VALIDATE $? "python"
fi

dnf list installed nginx

if [ $? -eq 0 ]; then
    echo "nginx is already installed on this system"
else
    dnf install nginx
    VALIDATE $? "nginx"
fi


