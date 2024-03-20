#!/bin/bash

sleep_status=$(systemd-inhibit --list)

if [[ $sleep_status != *"sleep"* ]]; then
  echo "The computer is in sleep mode. Exiting the script."
  exit
fi
lists=$(find quotelist/ -maxdepth 1 -type f -print0 | tr '\0' '\n' | awk -F '/' '{print $NF}')
list_len=$(ls -1 "quotelist/" | wc -l)

list_num=$((($(echo $RANDOM) % $list_len)+1))
list_file_name=$(echo "$lists" | awk "NR==$list_num")
quote_path="/$HOME/.config/quoteOfTheDay/quotelist/$list_file_name"
name=$list_file_name

declare -a quotes
while IFS= read -r line; do
	quotes+=("$line")
done < "$quote_path"

quote_length=${#quotes[@]}

index=$(($RANDOM % quote_length))

notify-send -t 0 "Quote Of the Day" "\"${quotes[index]}\" - ${name}"
