#!/bin/bash

user="$(whoami)"

if sudo mkdir /mnt/vlt ; then
    printf "\n[OK] changing permissions...\n"
    sudo chmod 777 /mnt/vlt
    sudo chown $user:$user /mnt/vlt
fi
printf "\n[OK] done\n"

sudo apt update
sudo apt install krdc -y
sudo apt install screen -y
sudo apt install openvpn -y
sudo apt install ntfs-3g -y
sudo apt install cifs-utils -y
sudo apt install openvpn-systemd-resolved -y
sudo apt install cryptsetup -y
sudo apt install keepass2 -y

printf "\n\nDone! Please restart\n"
read -ep "restart ? y/n: " x
if [ "$x" == 'y' ]; then
    sudo reboot
fi
