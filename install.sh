
packages=('hyprland' 'hyprpaper' 'hyprpicker' 'hypridle' 'xdg-desktop-portal-hyprland' 'hyprlock' 
          'waybar' 'wofi' 'sddm' 'imagemagick' 'alacritty' 'hyprsunset' 'hypridle'
          'slurp' 'wl-clipboard' 'grim' 
          'tree' 'tokei'
          'unzip' 'zip' '7zip' 'jq'
          'pipewire' 'pipewire-alsa' 'pipewire-pulse' 'mpv'
          'imv' 'zathura' 'glow' 'pandoc-cli'
          'vlc' 'yt-dlp'
          'neovim' 'python-pynvim' 'fd'
          'keypassxc'
          'ttf-jetbrains-mono-nerd'
          'thunar' 'thunar-archive-plugin' 'thunar-media-tags-plugin'
          'htop' 'fzf' 
          'python-pipx'
          'net-tools' 'bind')
echo "make sure to create a backup of you configuration!" 
read -p "install packages? [y/n] " input

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

packages=('rustscan' 'nmap' 'exiftool' 'hexedit' 'whois')

read -p "install pentest packages? [y/n] " input

if [[ $input == "y" ]]; then
  for package in $packages; do 
    sudo pacman -S $package
  done
fi



echo "install finished"
read -p "reboot? [y/n] " input

if [[ $input == "y" ]]; then
  reboot
fi

