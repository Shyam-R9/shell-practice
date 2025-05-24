#!/bin/bash

USERID=$(id -u)

if [ USERID -ne 0 ]; then
    echo "You are installing with root access"
else
    echo "Error: Install with root/admin access"
    exit 1
fi

dnf list installed mysql

if [ $? -ne 0 ]; then
    echo "Installing mysql"
    dnf install mysql -y
    if [ $? -ne 0 ]; then
        echo "my sql installation failed."
        exit 1
else
    echo "SQL Installed successfully"

