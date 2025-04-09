
packages=('hyprland' 'hyprpaper' 'hyprpicker' 'hypridle' 'xdg-desktop-portal-hyprland' 'hyprlock' 
          'waybar' 
          'imv' 'zathura' 'vlc' 'yt-dlp' 'neovim')

read -p "make sure to create a backup of you configuration! install packages? [y/n] " input

if [[ $input == "y" ]]; then
  sudo pacman -Syu
  for package in $packages; do 
    sudo pacman -S $package
  done
fi
  
read -p "Setup Bluetooth? [y/n] " input

if [[ $input == "y" ]]; then
  sudo pacman -S bluez blueman bluez-utils
  modprobe btusb
  sudo systemctl enable bluetooth.service
  sudo systemctl start bluetooth.service
  echo "Bluetooth enabled"
fi

