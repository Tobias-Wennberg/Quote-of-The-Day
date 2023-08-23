
- Create directory at `~/.config/quoteOfTheDay/` and copy quote.sh and quotes.txt there.
- Create directory at `.config/systemd/user/` and copy quoteOfDay.service quoteOfDay.timer there.
- Enable the timer with `systemctl --user enable quoteOfDay.timer` and `systemctl --user start quoteOfDay.timer`  

Become wise with the word of Mao Zedong every hour.
