#!/bin/bash


printf "\n"; read -ep "Current User: " user

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

cp bashrc /home/$user/.bashrc
chown $user:$user  /home/$user/.bashrc
printf "\n[OK]replaced '.bashrc'"

#mkdir  /home/$user/Desktop/vlt
ln -s /mnt/vlt/  /home/$user/Desktop/
chown $user:$user  /home/$user/Desktop/vlt
chmod 777  /home/$user/Desktop/vlt
printf "\n[OK shortcut to vlt]"
