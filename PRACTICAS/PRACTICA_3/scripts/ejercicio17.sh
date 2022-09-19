#!/bin/bash
if [ $# -ne 0 ]; then
	echo "No se deben recibir parametros"
	exit 1
else
	for file in $(ls); do
		newName=$(echo $file | tr 'A-Z' 'a-z'| tr -d "a") 
		mv $file $newName
	done
fi
exit 0
