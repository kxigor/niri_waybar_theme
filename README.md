# niri dotfiles

Fedora 44, niri 26.04, waybar 0.15.0. Палитра — VS Code Dark High Contrast.

## Зависимости

```
sudo dnf install niri waybar mako fuzzel swaylock swaybg kitty \
                 wl-clipboard cliphist brightnessctl \
                 wireguard-tools NetworkManager-openvpn
```

## Установка

```
git clone git@github.com:kxigor/niri_waybar_theme.git
cd niri_waybar_theme

mkdir -p ~/.config/{niri,waybar/scripts,fuzzel,mako,swaylock,kitty}

cp niri/config.kdl         ~/.config/niri/
cp waybar/config           ~/.config/waybar/
cp waybar/style.css        ~/.config/waybar/
cp waybar/scripts/vpn-toggle.sh ~/.config/waybar/scripts/
chmod +x ~/.config/waybar/scripts/vpn-toggle.sh
cp fuzzel/fuzzel.ini       ~/.config/fuzzel/
cp mako/config             ~/.config/mako/
cp swaylock/config         ~/.config/swaylock/
cp kitty/kitty.conf        ~/.config/kitty/
```

## VPN

Модуль VPN в waybar показывает активное подключение, по клику открывает fuzzel-меню со списком профилей. Профили добавляются через `nm-connection-editor` или `nmcli con import`.
