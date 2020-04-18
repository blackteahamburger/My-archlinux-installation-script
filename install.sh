#!/bin/bash

wifi-menu
timedatectl set-ntp true
fdisk -l
mkfs.ext4 /dev/yourpartition
mkfs.fat -F 32 /dev/yourpartition
mount /dev/yourpartition /mnt
mkdir /mnt/boot
mount /dev/yourpartition /mnt/boot
sed -i '/yourlocale/!{n;/Server/s/^/#/};t;n' /etc/pacman.d/mirrorlist
pacstrap -i /mnt base linux-zen linux-firmware nano
genfstab -U /mnt >> /mnt/etc/fstab
echo "Arch Linux has been installed. Please copy config.sh to /mnt, use arch-chroot /mnt to switch to the new system, and then run config.sh.
