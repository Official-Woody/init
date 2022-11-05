#!/bin/bash

while [ 1 == 1 ]; do
clear
    printf "    _____  ___     __  ___ ____   ___ \n"
    printf "   / ___/ /   |   /  |/  // __ ) /   |\n"
    printf "   \__ \ / /| |  / /|_/ // __  |/ /| |\n"
    printf "  ___/ // ___ | / /  / // /_/ // ___ |\n"
    printf " /____//_/  |_|/_/  /_//_____//_/  |_|\n"
    printf "_______________________________________\n"

    printf "\n"; read -ep "Force unmount ? y/*: " funmount
    if [ "$funmount" == "y" ]; then
        printf "\n"; read -ep "Data loss is possible, are you sure ? YES/*: " sure1
        if [ "$sure1" == "YES" ]; then
            sudo umount -f /mnt/vlt
            printf "\n\n"; read -ep "Press any button to restart..." x
        fi
    fi
    printf "skip...\n\n"
    if mountpoint -q /mnt/vlt ; then
        printf "WARNING: Already mounted\n"
        read -ep "unmount? y/*: " unmount
        if [ "$unmount" == "y" ]; then
            sudo umount /mnt/vlt
        fi
    else
        read -ep "Host: " host
        read -ep "DIR : " dir
        read -ep "User: " user
        if sudo mount -t cifs //$host/$dir /mnt/vlt/ -o username=$user,file_mode=0777,dir_mode=0777 ;then
            exit
        else
            printf "\n\n"; read -ep "Press any button to restart..." x
        fi
    fi
done
