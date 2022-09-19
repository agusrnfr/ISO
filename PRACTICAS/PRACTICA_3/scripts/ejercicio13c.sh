#!/bin/bash
if [ $# -ne 1 ]; then
	exit 1
else
	if [ -f $1 ]; then
		echo "Existe, es un archivo"
	elif  [ -d $1 ]; then
		echo "Existe, es un directorio"
	else
		echo "No existe, vamos a crearlo"
		mkdir $HOME/$1
		echo "$(ls $HOME)"
	fi
fi
exit 0
