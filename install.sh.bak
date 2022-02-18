declare -g safe=1
#safe=0

ansired="\033[0;31m"
ansigreen="\033[0;32m"
ansireset="\033[0m"

if [ ${safe} -eq 1 ]
then
	echo -e "${ansigreen}\nRunning in safe mode. Changes will not affect system${ansireset}"
else
	echo -e "${ansired}\nSAFETY IS OFF. CHANGES WILL AFFECT SYSTEM${ansireset}"
fi

echo -e "Welcome to install.sh\n"
read -p "Press any key to continue..." key

echo -e "Select which partition to install to:\n"

lsblk
echo

read -p "sd*x : " part
echo

if [ -b /dev/$part ]
then
	echo -e "Found /dev/$part\n"
else
	echo "Partition /dev/$part was not found\n"
	exit 1
fi
root=/mnt
echo -e "Mount /dev/$part to ${root}\n"
#mount /dev/$part ${root}

echo -e "Creating /etc/fstab\n"
#genfstab -U ${root} > ${root}/etc/fstab

declare -g passokroot=0
while [ ${passokroot} -eq 0 ]
do
	read -s -p "Enter the password for root user(hidden): " passroot
	echo
	read -s -p "Enter the password you root user again(hidden): " passroot2
	echo

	if [ ${passroot} != ${passroot2} ]
	then
		echo -e "Password mismatch. try again...\n"
	else
		passokroot=1
	fi
done
echo 

read -p "Enter the username you wish to use: " name
echo

declare -g passok=0
while [ ${passok} -eq 0 ]
do
	read -s -p "Enter the password you with to use(hidden): " pass
	echo
	read -s -p "Enter the password you with to use again(hidden): " pass2
	echo

	if [ ${pass} != ${pass2} ]
	then
		echo -e "Password mismatch. try again...\n"
	else
		passok=1
	fi
done
echo

kernel="linux-zen"
basepkg="${kernel} ${kernel}-headers grub networkmanager man sudo opendoas"

echo -e "Now installing base packages:\n${basepkg}\n"
#pacstrap ${root} ${basepkg}

echo -e "Copying chrooted.sh to ${root}"
#cp chrooted.sh ${root}

echo -e "Chrooting into new root ${root}\n"
#arch-chroot ${root} /chrooted.sh ${name} ${pass} ${passroot} ${part}

echo -e "Copy postinstall.sh to ${root}/home/${name}/postinstall.sh\n"
#cp postinstall.sh ${root}/home/${name}/
#chmod a+rx ${root}/home/${name}/postinstall.sh

echo -e "Installation complete...\n"
echo "Reboot and then run /home/${name}/postinstall.sh after login to finalize installation"
