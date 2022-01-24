#!/bin/bash
#Clean Install
rm -f "/data/data/com.termux/files/home/bin/termux-url-opener"
mkdir /data/data/com.termux/files/home/bin

#Installing dependencies
pkg update -y && pkg install python -y && pkg install ffmpeg -y
yes | pip install youtube-dl

#Installing the script
cp termux-url-opener $HOME/bin/
chmod +x "$HOME/bin/termux-url-opener"
termux-setup-storage

#fish + config
pkg install fish
#install powerline???
#pkg install wget
#wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
#wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
#mkdir ~/.fonts/
#mv PowerlineSymbols.otf ~/.fonts/
#mkdir -p ~/.config/fontconfig/conf.d
#mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
omf install lambda
#launch on termux start
chsh -s /data/data/com.termux/files/usr/bin/fish

#neofetch
pkg install neofetch
# run at termux start => ~/.config/fish/config.fish
