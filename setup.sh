#!/bin/bash


echo "Removing password for current user's sudo permisinos..."
sudo bash -c "echo '$(whoami) ALL=(ALL:ALL) NOPASSWD: ALL'  >>  /etc/sudoers"

echo "Installing dependencies..."
sudo apt update -y
sudo apt install --fix-missing
sudo apt install i3 rofi feh xclip picom -y
sudo apt install zsh nvim tmux snapd -y 
snap install alacritty

echo "Dropping configs..."

mkdir -p ~/.vpns
mkdir -p ~/.config/i3
mkdir -p ~/.config/rofi
cp configs/.tmux.conf ~/
cp configs/.config/i3/config ~/.config/i3/
cp -r configs/.config/alacritty ~/.config/

sudo cp configs/.setbg /opt/.setbg && sudo chmod +x ~/.setbg

tmux source ~/.tmux.conf
git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes

echo "Adding fonts..."
mkdir ~/.fonts
git clone https://github.com/sahibjotsaggu/San-Francisco-Pro-Fonts && mv San-Francisco-Pro-Fonts ~/.fonts/
sudo fc-cache -f -v


echo "session optional pam_exec.so /opt/.setbg" >> /etc/pam.d/common-session


read -p "Reboot now (Y/n)" answer
if [ -z "$answer" ]; then
    answer="yes"
fi
case $answer in
  [yY] | [yY][eE][sS])
    echo "Rebooting system now..."
    sudo shutdown -r now
    ;;
  [nN] | [nN][oO])
    echo "System reboot cancelled."
    ;;
  *)
    echo ""
    ;;
esac
