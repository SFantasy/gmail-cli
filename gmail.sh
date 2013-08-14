#!/bin/bash
#FileName: gmail.sh

#Modify your username here
username="forever.fantasy27@gmail.com"

SHOW_COUNT=5

echo 'Gmail-cli'
echo '------'
if [ "$1" == "-n" -a -n "$2" ]; then
	SHOW_COUNT=$2
elif [ "$1" == "-n" -a -z "$2" ]; then
	echo 'How many mails do you want to see?'
	echo '(input number after "-n".)'
	exit 0
elif [ -z "$1" -a -z "$2" ]; then
	echo '5 mails shown as default:'
elif [ "$1" == "check" ]; then
	COUNT=$(curl -u $username --silent "https://mail.google.com/mail/feed/atom" | awk '/^<fullcount>/' | sed 's/<fullcount>//' | sed 's/<\/fullcount>//')
	if [ "$COUNT" == "0" ]; then
		echo 'Inbox empty'
	else
		echo $COUNT ' mails unread'
	fi
	exit 0
fi

#Log in your Gmail 
curl -u $username  --silent "https://mail.google.com/mail/feed/atom" | \
tr -d '\n' | \
sed 's:</entry>:\n:g' | \
sed 's/.*<title>\(.*\)<\/title.*<author><name>\([^<]*\)<\/name><email>\([^<]*\).*/Author: \2 [\3] \nSubject: \1\n/' | \
head -n $(( $SHOW_COUNT * 4 ))
