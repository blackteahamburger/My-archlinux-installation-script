#!/bin/sh

wifi-menu
timedatectl set-ntp true
fdisk -l
mkfs.ext4 /dev/sdXx
mkfs.fat -F 32 /dev/sdXx
mount /dev/sdXx /mnt
mkdir /mnt/boot
mount /dev/sdXx /mnt/boot
nano /etc/pacman.d/mirrorlist
pacstrap /mnt base linux-zen linux-firmware nano
genfstab -U /mnt >> /mnt/etc/fstab
