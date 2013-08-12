#!/bin/bash
#Filename: install.sh

echo "Welcome to use Gmail-cli"
echo "Checking...(this may need your root password)"

#If you have curl installed
which curl > /dev/null 2>&1
if [ $? == 0 ]; then
	echo 
else 
	echo "Gmail-cli requires curl, install it first"
fi

echo "Setting up your Gmail account..."
read -p 'Input your username:' username

sudo chmod 775 gmail.sh
#Link it
ln ./gamil.sh /bin/gmail

echo 'Gmail-cli insalled.'