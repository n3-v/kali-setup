#!/bin/bash

echo "Removing password for current user's sudo permisinos..."
sudo bash -c "echo '$(whoami) ALL=(ALL:ALL) NOPASSWD: ALL'  >>  /etc/sudoers"

echo "Installing the basics..."
sudo apt update -y
sudo apt install --fix-missing

sudo apt install i3 rofi feh xclip picom i3blocks compton fzf pipx -y
sudo apt install zsh tmux -y 

echo "Installing tools..."
bash ./tools.sh

echo "Dropping configs..."

mkdir -p ~/.vpns

cd configs && cp -r . ~/
cd -

# tmux setup
tmux source ~/.tmux.conf

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

source ~/.zshrc

# alacritty setup 
sudo apt install cmake g++ pkg-config libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
cargo install alacritty
git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes
alacritty migrate

echo "Adding fonts..."
mkdir ~/.fonts
git clone https://github.com/sahibjotsaggu/San-Francisco-Pro-Fonts && mv San-Francisco-Pro-Fonts ~/.fonts/
sudo fc-cache -f -v


# tools
pipx ensurepath
pipx install bloodyAD certipy-ad

