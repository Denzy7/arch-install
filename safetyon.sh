ansigreen="\033[0;32m"
echo -e ${ansigreen}
SHFILES=$(ls *.bak)
for i in ${SHFILES}
do
	SHFILE=${i%.*}
	cat ${i} > ${SHFILE}
	chmod +x ${SHFILE}
done


echo "SAFETY IS ON..."
