#!/bin/bash
if [ $# -lt 1 ]; then
	exit 1
fi

esta_logeado () {
	if [ $(who | cut -d" " -f1 | grep -w $1 | wc -l) -ne 0 ]; then
		return 0
	fi
	return 1
}

cant_procesos () {
	esta_logeado $1
	if [ $? -eq 0 ]; then
		return $(ps -aux | grep -w $1 | wc -l)
	else
		return 0
	fi
}

uso_de_procesos () {
	cant_procesos $1
	if [ $? -ge 60 ]; then
		return 0
	fi
	return 1
}

echo "FECHA: $(date)">>/var/log/reporte
for i in $* ; do
	uso_de_procesos $i
	if [ $? -eq 0 ]; then
		echo "NOMBRE: $i" >>/var/log/reporte
	fi
done
exit 0
