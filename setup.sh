#!/bin/bash

echo "Removing password for current user's sudo permisinos..."
sudo bash -c "echo '$(whoami) ALL=(ALL:ALL) NOPASSWD: ALL'  >>  /etc/sudoers"

echo "Installing the basics..."
sudo apt update -y
sudo apt install --fix-missing

sudo apt install i3 rofi feh xclip picom i3blocks -y
sudo apt install zsh tmux -y 

echo "Installing tools..."
bash ./tools.sh

echo "Dropping configs..."

mkdir -p ~/.vpns

mkdir -p ~/.config/i3
mkdir -p ~/.config/rofi
mkdir -p ~/.config/compton

cp configs/.zshrc ~/.zshrc
cp configs/.tmux.conf ~/

cp configs/.config/i3/config ~/.config/i3/
sudo cp configs/i3blocks.conf /etc/i3blocks.conf
cp -r configs/.config/alacritty ~/.config/
cp configs/.config/compton/compton.conf ~/.config/compton/compton.conf


# tmux setup
tmux source ~/.tmux.conf

# alacritty setup 
sudo apt install cmake g++ pkg-config libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
cargo install alacritty
git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes
alacritty migrate

echo "Adding fonts..."
mkdir ~/.fonts
git clone https://github.com/sahibjotsaggu/San-Francisco-Pro-Fonts && mv San-Francisco-Pro-Fonts ~/.fonts/
sudo fc-cache -f -v

