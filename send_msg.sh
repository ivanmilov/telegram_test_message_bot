#!/bin/bash

#################################################################
# multi-service monitoring script:
# generic scipt for web service monitoring
# check service with curl, report alerts to telegram
# (!) current directory should be "services"
#################################################################

# telegram endpoint
TG_API_URL="https://api.telegram.org/bot$(cat api)/sendMessage"

#################################################################
# send message to telegram
# parameter: message text
# recipients chat id list should be in "recipients.txt" file
#################################################################
function send_message {
    for chat_id  in $(cat id); do
	curl -s -X POST --connect-timeout 10 $TG_API_URL -d chat_id=$chat_id -d parse_mode="Markdown" -d text="$1"  # > /dev/null
	echo
    done
}

send_message "$1"
