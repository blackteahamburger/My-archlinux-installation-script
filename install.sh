#!/bin/bash

while getopts "h:i" opt;do
 case ${opt} in
  h) help ;;
  i) install ;;
  *) help ;;
 esac
done

help(){
 echo "Options:"
 echo "-i Installing Arch Linux"
 echo "-h Display this help"
}

install(){
 wifi-menu
 timedatectl set-ntp true
 fdisk -l
 mkfs.ext4 /dev/sdXx(yourpartition)
 mkfs.fat -F 32 /dev/sdXx(yourpartition)
 mount /dev/sdXx(yourpartition) /mnt
 mkdir /mnt/boot
 mount /dev/sdXx(yourpartition) /mnt/boot
 sed -i '/yourlocale/!{n;/Server/s/^/#/};t;n' /etc/pacman.d/mirrorlist
 pacstrap /mnt base linux-zen linux-firmware nano
 genfstab -U /mnt >> /mnt/etc/fstab
}
