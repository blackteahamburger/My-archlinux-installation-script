# My-archlinux-installation-script

这是我的Arch Linux安装脚本。

必须在运行前编辑脚本，把诸如"yourlocale"的地方根据实际情况更改。这个安装脚本也只适用于特定用户和特定计算机配置，请根据个人喜好和计算机配置更改。

install.sh是用来安装Arch Linux系统的，config.sh是用来配置系统的。请在安装映像环境内先运行install.sh，将config.sh复制到/mnt，再arch-chroot /mnt到新系统，然后运行config.sh。你需要在安装前的另一个操作系统中将储存库克隆下来。在需要运行时，挂载安装脚本所在的分区。

install.sh与config.sh的权限已被设置为可执行。
