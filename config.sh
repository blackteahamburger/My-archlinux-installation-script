#!/bin/sh

ln -sf /usr/share/zoneinfo/Region/City /etc/localtime
hwclock --systohc
nano /etc/locale.gen
locale-gen
nano /etc/locale.conf
nano /etc/hostname
nano /etc/hosts
passwd
pacman -S grub efibootmgr os-prober intel-ucode dosfstools ntfs-3g
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
exit

