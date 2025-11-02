#!/bin/bash
# скрипт для отправки сообщения в Telegram через API
#curl -s -X POST -d
#"name=Valeriy&age=30"
#https://example.com/for

curl -s -X POST "https://api.telegram.org/bot8152779442:AAEWXUKLbLTehMY683ed9JZClzSKnJPQQO0/sendMessage" \
    -d chat_id=36615026 \
    -d text="Файл измененен!"