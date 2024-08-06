#!/bin/bash



sudo bash -c "echo '$(whoami) ALL=(ALL:ALL) NOPASSWD: ALL'  >>  /etc/sudoers"


sudo apt update && sudo apt upgrade
sudo apt install --fix-missing

sudo apt install i3 rofi feh xclip picom -y


sudo apt install alcritty zsh vim tmux -y 




mkdir -p ~/.vpns
mkdir -p ~/.config/i3
mkdir -p ~/.config/rofi



echo "Setting configs"
cp configs/.tmux.conf ~/
cp configs/.config/i3/config ~/.config/i3/
cp -r configs/.config/alacritty ~/.config/
cp configs/.fegbg ~/.fegbg




tmux source ~/.tmux.conf


sudo apt install kali-wallpapers-all
git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes

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
