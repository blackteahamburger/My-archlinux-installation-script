#!/bin/bash

while getopts "h:c" opt;do
 case ${opt} in
  h) help ;;
  c) configure ;;
  *) help ;;
 esac
done

help(){
 echo "Options:"
 echo "-c Configure Arch Linux"
 echo "-h Display this help"
}

configure(){
 ln -sf /usr/share/zoneinfo/yourregion/yourcity /etc/localtime
 hwclock --systohc
 sed -i '/yourlocale/{s/#//}' /etc/locale.gen
 locale-gen
 echo "yourlocale" >> /etc/locale.conf
 echo "yourhostname" >> /etc/hostname
 echo "127.0.0.1 localhost
 ::1             localhost
 127.0.1.1       yourmyhostname.yourlocaldomain  yourmyhostname" >> /etc/hosts
 echo root:yourpasswd | chpasswd
 pacman -S grub efibootmgr os-prober yourCPU(Intel or AMD)-ucode dosfstools ntfs-3g
 grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
 grub-mkconfig -o /boot/grub/grub.cfg
 exit 
}
