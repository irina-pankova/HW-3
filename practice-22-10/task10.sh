#!/bin/bash
# Скрипт должен реагировать на команды пользователя и выполнять соответствующие действия.
# например, при вводе Дата бот должен выводить соответствующую дату
T="8152779442:AAEWXUKLbLTehMY683ed9JZClzSKnJPQQO0";
A="https://api.telegram.org/bot$T";
O=0
while true; do
    U=$(curl -s "$A/getUpdates?offset=$O")
    C=$(echo $U|jq -r '.result[-1].message.chat.id')
    TXT=$(echo $U|jq -r '.result[-1].message.text')
    ID=$(echo $U|jq -r '.result[-1].update_id')
    [ "$ID" != "null" ] && O=$((ID+1))
    if [ "$TXT" = "Дата" ]; then
        curl -s -X POST "$A/sendMessage" -d chat_id=$C -d text="$(date '+%d.%m.%Y')" >/dev/null
        break
    fi
    sleep 2
done

