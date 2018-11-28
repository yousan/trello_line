#!/bin/bash

#set -xe

TRELLO_KEY=xxxxx
TRELLO_TOKEN=xxxxx
TRELLO_LIST_ID=xxxxx
LINE_TOKEN=xxxxx

# jq -r '.[].name[]'

#CMD='curl -s '"https://api.trello.com/1/lists/${TRELLO_LIST_ID}/cards?key=${TRELLO_KEY}&token=$TRELLO_TOKEN"
#echo $CMD
#TASKS=`$CMD \| jq .`
#echo $TASKS
#curl -X POST -H 'Authorization: Bearer hoge' -F "message=$TASKS" https://notify-api.line.me/api/notify

TASKS=`curl  "https://api.trello.com/1/lists/${TRELLO_LIST_ID}/cards?key=${TRELLO_KEY}&token=$TRELLO_TOKEN" | jq -r '.[].name'`

curl -X POST -H "Authorization: Bearer ${LINE_TOKEN}"  -F "message=$TASKS" https://notify-api.line.me/api/notify
