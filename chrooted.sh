name=$1
pass=$2
passroot=$3
part=$4
disk=$(echo $part | sed 's/[[:digit:]]//g')
echo -e "Installing grub to /dev/$disk\n"
#grub-install /dev/$disk
#grub-mkconfig -o /boot/grub/grub.cfg

loc="en_GB.UTF-8"
echo -e "Using locale ${loc}\n"
#sed -i -e "s/#${loc}/${loc}/g" /etc/locale.gen
#echo "LANG=${loc}" > /etc/locale.conf
#locale-gen

echo -e "Creating user ${name} and /home/${name}\nSetting ${name}'s password\n"
#useradd -m ${name}
#passwd ${name} ${pass}

echo -e "Setting root password\n"
#passwd ${passroot}

srv="NetworkManager"
echo -e "Enable services\n${srv}\n"
#systemctl enable ${srv}

echo -e "Adding ${name} to wheel group for root access"
#usermod -aG wheel ${name}

echo -e "Add wheel to /etc/doas.conf\n"
#echo "permit persist :wheel" > /etc/doas.conf

echo -e "Make /etc/doas.conf only readable by root\n"
#chmod -rw /etc/doas.conf
#chmod u+r /etc/doas.conf

echo -e "Make /etc/sudoers writable\n"
#chmod u+rw /etc/sudoers

echo -e "Adding ${name} to /etc/sudoers\n"
#echo "${name} ALL=(ALL) ALL" >> /etc/sudoers

echo -e "Make /etc/sudoers only readable by root\n"
#chmod -rw /etc/sudoers
#chmod u+r /etc/sudoers

echo -e "Remove /chrooted.sh"
#rm /chrooted.sh