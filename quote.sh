#!/bin/sh

sleep_status=$(systemd-inhibit --list)

if [[ $sleep_status != *"sleep"* ]]; then
  echo "The computer is in sleep mode. Exiting the script."
  exit
fi



if [[ $(($(echo $RANDOM) % 2)) == "1" ]]; then
	quote_path="/$HOME/.config/quoteOfTheDay/quotes.txt"
	name="Mao Zedong"
else
    quote_path="/$HOME/.config/quoteOfTheDay/quotes_unabomber.txt"
	name="Theodore John Kaczynski"
fi

declare -a quotes
while IFS= read -r line; do
	quotes+=("$line")
done < "$quote_path"

quote_length=${#quotes[@]}

index=$((RANDOM % quote_length))

notify-send -t 0 "Quote Of the Day" "\"${quotes[index]}\" - ${name}"
