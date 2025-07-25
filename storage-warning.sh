#!/bin/bash
######################################################################
######## STORAGE SPACE WARNING SCRIPT ################################
######################################################################
# Hope people enjoy the many hours I have put into this project!
# This project is created with my knowledge and some snippets from 
# across the open web. If there are snippets you would like credit for. 
# Drop me a line and I'll add you!
# Anyone. Feel free to clone and improve.
####################################################
# DM me on:                                        #
# Telegram: https://t.me/joinchat/xlmtm7jVYR4yODQ0 #
####################################################


source telegram.conf
echo "$token" /dev/null 2&>1
echo "$chat_id" /dev/null 2&>1

#These are emoji codes 
# go to https://unicode.org/emoji/charts/full-emoji-list.html
# you will need its "U+1F4EB" code MINUS the + As seen below

bell=$'U1F514'
toolbox=$'\U1F9F0'
policelight=$'\U1F6A8'
exclamation=$'\U2757'
disk=$'\U1F4BD'

function telegram_send
{
curl -H 'Host: api.telegram.org' -s -X POST https://t.me/bot"$token"/sendMessage -d chat_id="$chat_id" -d text="$policelight Storage Warning

Your "YOUR_HD_LOCATION" partition available space is critically low on $(hostname) $(date) $exclamation

Used: $CURRENT% $disk"
}

CURRENT=$(df | grep '"YOUR_HD_LOCATION"' | awk '{print $5}' | sed 's/%//g')
THRESHOLD="YOUR_HD_THRESHOLD"
        if [ "$CURRENT" -gt "$THRESHOLD" ] ; then
        echo "$MESSAGE" | telegram_send
        fi
        
# >>>>>    To edit timing for this process:    nano /etc/systemd/system/storage-warning.timer     <<<<<<<<<
