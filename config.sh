#!/bin/bash

ln -sf /usr/share/zoneinfo/yourregion/yourcity /etc/localtime
hwclock --systohc
sed -i '/yourlocale/{s/#//}' /etc/locale.gen
locale-gen
echo "yourlocale" >> /etc/locale.conf
echo "yourhostname" >> /etc/hostname
echo "127.0.0.1 localhost
::1             localhost
127.0.1.1       yourhostname.yourlocaldomain  yourhostname" >> /etc/hosts
echo root:yourpasswd | chpasswd
pacman -S grub efibootmgr os-prober yourCPU-ucode dosfstools ntfs-3g
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
echo "Arch Linux has been installed and configured. Run exit to exit the chroot environment, and then restart to use arch Linux."

