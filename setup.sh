#!/bin/bash

echo "Removing password for current user's sudo perms..."
sudo bash -c "echo '$(whoami) ALL=(ALL:ALL) NOPASSWD: ALL'  >>  /etc/sudoers"

echo "Installing the basics..."
sudo apt update -y
sudo apt install --fix-missing

sudo apt install i3 rofi feh xclip picom i3blocks compton fzf pipx python3 python3-venv -y
sudo apt install zsh tmux -y 

echo "Installing tools..."
bash ./tools.sh

echo "Dropping configs..."

mkdir -p ~/.vpns
cd configs && cp -r . ~/
cd -


sudo cp wallpaper.jpg /opt/wallpaper

# tmux setup
tmux source ~/.tmux.conf

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
export PATH="$HOME/.cargo/bin:$PATH"
. "$HOME/.cargo/env"

# alacritty setup 
sudo apt install cmake g++ pkg-config libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev  -y
cargo install alacritty
git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes
alacritty migrate

RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sed -i 's/robbyrussell/lambda/g' ~/.zshrc

echo "Adding fonts..."
mkdir ~/.fonts
git clone https://github.com/sahibjotsaggu/San-Francisco-Pro-Fonts && mv San-Francisco-Pro-Fonts ~/.fonts/
sudo fc-cache -f -v


# tools
pipx ensurepath
pipx install bloodyAD certipy-ad

# arch=$(uname -m)

# if [[ "$arch" == "arm"* || "$arch" == "aarch64" ]]; then
#     ./arm-setup.sh
# fi

# wget https://github.com/espanso/espanso/releases/latest/download/espanso-debian-x11-amd64.deb
# sudo apt install ./espanso-debian-x11-amd64.deb -y

# espanso service register
# espanso start

