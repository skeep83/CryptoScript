#!/bin/bash
# Settings
telegram_token=telegram_token_string # <- Replace with your telegram bot token (e.g. 123123:123123)
telegram_chat_id=569834350 # <- Replace with your telegram chat id (e.g. 123123)
##########

# Send message to telegram
cd /root/ta-search
res=`git pull | grep "Already up to date."`
if [ "$res" == "Already up to date." ]; then
	echo already update
else
	# Send message
	# sv=`cat /root/NostalgiaForInfinity/experimental/NostalgiaForInfinityX2.py | grep  'return\s\"v' | awk '{print $2}'`
	# version=${sv//\"/}
	curl -s -X "POST" "https://api.telegram.org/bot${telegram_token}/sendMessage" \
		-H 'Content-Type: application/json; charset=utf-8' \
		-d $'{
			"chat_id": "'$telegram_chat_id'",
			"text": "<b>Update</b>\n<pre>Strategy has been updated.</pre>",
			"parse_mode": "HTML"
		}'
	# cp  /root/NostalgiaForInfinity/experimental/NostalgiaForInfinityX2.py /root/ft_userdata/user_data/strategies/
	# cd /root/ft_userdata
	# docker compose restart freqtrade
fi
