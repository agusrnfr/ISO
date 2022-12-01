#!/bin/bash
if [ $# -ne 0 ]; then
	exit 1
fi

for i in $(cat /etc/passwd); do
	dirP=$(echo "$i" | cut -d: -f6)
	bash=$(echo "$i" | cut -d: -f7)
	user=$(echo "$i" | cut -d: -f1)
#	if [ -d $dirP ]; then
		if [ $(sudo find $dirP -type d -name mailDir | wc -l) -eq 1 ] && [ "$bash" = "/bin/bash" ]
		then 
			echo "$user" >>/var/reporte.txt
		fi
#	fi
done
exit 0
