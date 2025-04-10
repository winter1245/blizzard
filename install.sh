
packages=('hyprland' 'hyprpaper' 'hyprpicker' 'hypridle' 'xdg-desktop-portal-hyprland' 'hyprlock' 
          'waybar' 'wofi' 'sddm' 'imagemagick' 'alacritty'
          'slurp' 'wl-clipboard'
          'unzip'
          'pipewire' 'pipewire-alsa' 'pipewire-pulse' 'mpv'
          'imv' 'zathura' 'glow'
          'vlc' 'yt-dlp'
          'neovim' 'python-pynvim' 'fd'
          'keypassxc'
          'ttf-jetbrains-mono-nerd'
          'thunar' 'htop' 'fzf')

read -p "make sure to create a backup of you configuration! install packages? [y/n] " input

if [[ $input == "y" ]]; then
  sudo pacman -Syu
  for package in $packages; do 
    sudo pacman -S $package
  done
fi
  
read -p "Setup NetworkManger? [y/n] " input

if [[ $input == "y" ]]; then
  sudo pacman -S networkmanager network-manager-applet
  sudo systemctl enable NetworkManager.service
  sudo systemctl start NetworkManager.service
  echo "NetworkManager enabled"
fi

read -p "Setup Bluetooth? [y/n] " input

if [[ $input == "y" ]]; then
  sudo pacman -S bluez blueman bluez-utils
  modprobe btusb
  sudo systemctl enable bluetooth.service
  sudo systemctl start bluetooth.service
  echo "Bluetooth enabled"
fi


echo "install finished"
read -p "reboot? [y/n] " input

if [[ $input == "y" ]]; then
  reboot
fi

