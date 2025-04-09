
packages=('hyprland' 'hyprpaper' 'hyprpicker' 'hypridle' 'xdg-desktop-portal-hyprland' 'hyprlock' 
          'waybar' 
          'imv' 'zathura' 'vlc' 'yt-dlp' 'neovim')

read -p "make sure to create a backup of you configuration! continue? [y/n] " input

if [[ $input == "n" ]]; then
  echo "1"
  exit
fi
echo "2"

sudo pacman -Syu

for package in $packages; do 
  sudo pacman -S $package
done

