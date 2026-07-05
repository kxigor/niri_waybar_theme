#!/bin/bash
active_vpns=$(nmcli -t -f NAME,TYPE,STATE con show --active | grep ':vpn:activated\|:wireguard:activated' | cut -d: -f1)
all_vpns=$(nmcli -t -f NAME,TYPE con show | grep ':vpn\|:wireguard' | cut -d: -f1)

[ -z "$all_vpns" ] && exit 0

list=""
while IFS= read -r vpn; do
    if echo "$active_vpns" | grep -qxF "$vpn"; then
        list+="+ $vpn\n"
    else
        list+="- $vpn\n"
    fi
done <<< "$all_vpns"

selected=$(printf "$list" | fuzzel --dmenu)
[ -z "$selected" ] && exit 0

name=$(echo "$selected" | sed 's/^[+-] //')

if echo "$active_vpns" | grep -qxF "$name"; then
    nmcli con down "$name"
else
    nmcli con up "$name"
fi
