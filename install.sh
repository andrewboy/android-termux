#!/bin/bash

# INIT =========================================================================
github_url="https://github.com/andrewboy/android-termux/raw/main"
termux_root="/data/data/com.termux/files"

# Termux update repos
#termux-change-repo #not working

# Setup termux storage
#termux-setup-storage -y

# Update packages
yes | pkg update && \
yes | pkg upgrade

# TERMUX CONFIG ================================================================

#Install config
mkdir -p $HOME/.termux

termux_file_name="termux.properties"

if ! [ -f $termux_file_name ];
then
    curl -sSL -O --output-dir $HOME $github_url/$termux_file_name
else
    cp $termux_file_name $_/
fi

termux-reload-settings

# PKG ==========================================================================

pkg install -y curl fastfetch bat eza nodejs-lts php mc openssh git nala python python-pip wget
#neovim

# TERMUX URL OPENER ============================================================

curl -sSL https://github.com/andrewboy/termux-yt-dl/raw/main/install.sh | bash

# STARSHIP =====================================================================

pkg install starship
wget -O ~/.termux/font.ttf https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Ligatures/Medium/JetBrainsMonoNerdFontMono-Medium.ttf
starship preset gruvbox-rainbow -o ~/.config/starship.toml

# FISH =========================================================================

pkg install -y fish
mkdir -p $HOME/.config/fish/conf.d

fish_file_name="custom.fish"

if ! [ -f $fish_file_name ];
then
    curl -sSL -O --output-dir $HOME $github_url/$fish_file_name
else
    cp $fish_file_name $_/
fi

chsh -s fish

# BASH =========================================================================

bash_file_name=".bashrc"

if ! [ -f $bash_file_name ];
then
    curl -sSL -O --output-dir $HOME $github_url/$bash_file_name
else
    cp $bash_file_name $HOME
fi

# PNPM =========================================================================

npm install -g pnpm

# COMPOSER =====================================================================

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === 'dac665fdc30fdd8ec78b38b9800061b4150413ff2e3b6f88543c636f7cd84f6db9189d43a81e5503cda447da73c7e5b6') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
mv composer.phar $termux_root/usr/bin/composer

# ANSIBLE =====================================================================

yes | pkg upgrade && \
yes | pkg install \
    openssl python rust build-essential
pip install --upgrade pip setuptools wheel
export CARGO_BUILD_TARGET=aarch64-linux-android
pip install --upgrade cryptography ansible pywinrm[credssp]

ansible_cfg_file_name=".ansible.cfg"

if ! [ -f $ansible_cfg_file_name ];
then
    curl -sSL -O --output-dir $HOME $github_url/$ansible_cfg_file_name
else
    cp $ansible_cfg_file_name $HOME
fi

hosts_file_name="hosts"

if ! [ -f $hosts_file_name ];
then
    curl -sSL -O --output-dir $HOME $github_url/$hosts_file_name
else
    cp $hosts_file_name $HOME
fi

playbook_file_name="playbook.yml"

if ! [ -f $playbook_file_name ];
then
    curl -sSL -O --output-dir $HOME $github_url/$playbook_file_name
else
    cp $playbook_file_name $HOME
fi