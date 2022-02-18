ansired="\033[0;31m"

echo -e "${ansired}ARE YOU SURE YOU WANT TO DISABLE SAFETY?\n[y/n]: "
read disable
if [ ${disable} = "y" ]
then
	SHFILES=$(ls *.bak)
	for i in ${SHFILES}
	do
		SHFILE=${i%.*}
		cat ${i} | sed 's/#//g' > ${SHFILE}
		chmod +x ${SHFILE}
	done


	echo "SAFETY IS OFF. Run ./install.sh when ready..."
fi

