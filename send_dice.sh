#!/bin/bash

# telegram endpoint
TG_API_URL="https://api.telegram.org/bot$(cat api)/sendDice"

#################################################################
# send message to telegram
# parameter: message text
# recipients chat id list should be in "id" file
#################################################################
function send_dice {
    for chat_id  in $(cat id); do
	curl -s -X POST --connect-timeout 10 $TG_API_URL -d chat_id=$chat_id # > /dev/null
	echo
    done
}

send_dice "$1"
