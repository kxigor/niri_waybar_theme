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

## SSH agent

```
systemctl --user enable --now ssh-agent
mkdir -p ~/.config/environment.d
echo 'SSH_AUTH_SOCK=/run/user/1000/ssh-agent.socket' > ~/.config/environment.d/ssh-agent.conf
```

После этого перелогиниться и выполнить `ssh-add ~/.ssh/id_ed25519`.

## Тёмная тема GTK

```
mkdir -p ~/.config/gtk-3.0 ~/.config/gtk-4.0
printf '[Settings]\ngtk-application-prefer-dark-theme=1\n' \
    | tee ~/.config/gtk-3.0/settings.ini ~/.config/gtk-4.0/settings.ini
```

## VPN

Модуль VPN в waybar показывает активное подключение, по клику открывает fuzzel-меню со списком профилей. Профили добавляются через `nm-connection-editor` или `nmcli con import`.
