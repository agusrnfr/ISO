#!/bin/bash
if [ $# -ne 1 ]; then
	exit 2
fi
if [ $(cat /etc/passwd | cut -d: -f1 | grep -w $1 | wc -l) -eq 0 ]; then
	exit 1
else
	while true; do
		if [ $(who | cut -d" " -f1 | grep -w $1| wc -l) -ne 0 ]; then
			echo "Usuario: $1 | Fecha: $(date)" >>/var/log/access${1}.log
			if [ $(cat /var/log/access${1}.log | wc -l) -eq 30 ]; then
				break
			fi
		fi
		echo "Buscando..."
		sleep 3
	done
	exit 0
fi
