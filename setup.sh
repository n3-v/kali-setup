#!/bin/bash



sudo bash -c "echo '$(whoami) ALL=(ALL:ALL) NOPASSWD: ALL'  >>  /etc/sudoers"


sudo apt update && sudo apt upgrade 
sudo apt install --fix-missing

sudo apt install i3 rofi feh xclip -y
sudo apt install --no-install-recommends install sddm -y


sudo apt install zsh vim tmux git -y 



mkdir .vpns

