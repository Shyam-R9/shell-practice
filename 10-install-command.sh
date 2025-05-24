#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "Error: You are not installing with root access"
    exit 1
else
    echo "You are installing with root access"

fi

dnf list installed mysql

if [ $? -ne 0 ]; then
    echo "Installing mysql"

    dnf install mysql -y

    if [ $? -ne 0 ]; then
        echo "my sql installation failed."
        exit 1
    else
        echo "sql installed successfully" 
    fi
else
    echo "SQL already installed"
fi

