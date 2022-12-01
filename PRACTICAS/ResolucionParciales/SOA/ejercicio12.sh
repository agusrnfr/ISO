#!/bin/bash
if [ $# -ne 1 ]; then
	exit 1
fi

archivo="/home/agusnfr/parcial/archivoPrueba.log"
while true; do
	if [ -f "$archivo" ]; then
		echo "Existe"
		if [ $(cat $archivo | grep "FATAL ERROR:" | wc -l) -ge 1 ]; then
			tar -czvf ${1}/parcial.tar.gz /home/agusnfr/Descargas/*
			echo "$(cat $archivo | grep "FATAL ERROR:" | wc -l )"
			exit 0
		fi
	fi
	echo "Buscando..."
	sleep 5
done
