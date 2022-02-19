if ! [ $(id -u) -eq 0 ]
then
	echo "This script must run as root"
	exit 1
fi

echo -e "Setup time to UTC.Locales are found in /usr/share/zoneinfo\n"
ln -sf /usr/share/zoneinfo/Universal /etc/localtime
hwclock --systohc

loc="en_GB.UTF-8"
echo -e "Using locale ${loc}\n"
sed -i -e "s/#${loc}/${loc}/g" /etc/locale.gen
echo "LANG=${loc}" > /etc/locale.conf
locale-gen

