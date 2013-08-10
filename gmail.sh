#!/bin/bash
#FileName: gmail.sh

username="forever.fantasy27@gmail.com"

SHOW_COUNT=5

echo 'Welcome to use gmail-cli'

#Log in your Gmail 
curl -u $username  --silent "https://mail.google.com/mail/feed/atom" | \
tr -d '\n' | \
sed 's:</entry>:\n:g' | \
sed 's/.*<title>\(.*\)<\/title.*<author><name>\([^<]*\)<\/name><email>\([^<]*\).*/Author: \2 [\3] \nSubject: \1\n/' | \
head -n $(( $SHOW_COUNT * 4 ))
