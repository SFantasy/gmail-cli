#!/bin/bash
#Filename: install.sh

echo "Welcome to use Gmail-cli"
echo "Checking..."

#If you have curl installed
which curl > /dev/null 2>&1
if [ $? == 0 ]; then
	echo 
else 
	echo "Gmail-cli requires curl, install it first"
fi

echo "Setting up your Gmail account..."
read -p 'Input your username:' username