#!/bin/bash
if [ $# -ne 1 ]; then
	echo "No se pasaron bien los parametros"
	exit 1
else
	for usuarios in $(cat /etc/passwd | cut -d: -f1); do
		var=$(sudo find /home -user ${usuarios} -name "*$1" | wc -l)
		echo " USUARIO: $usuarios | CANTIDAD: $var" >> $HOME/reporte.txt
	done
fi
exit 0
