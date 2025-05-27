#!/bin/bash

USERID=$(id -u)

if [ "$USERID" -eq 0 ]; then
    echo "You are installing with root access"
else
    echo "Error: You need admin access to install mysql"
    exit 1
fi

echo "Checking if mysql is already installed"

dnf list installed mysql

if [ $? -eq 0 ]; then
    echo "MySql is already installed on this system"
    exit 0
else
    echo "MySql is not installed on this system, proceeding to install"
    
    dnf install mysql -y
    
    if [ $? -eq 0 ]; then
        echo "MySql installed successfully"
    else
        echo "MySQL installation failed"

    fi
fi

    