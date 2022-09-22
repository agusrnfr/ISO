#!/bin/bash
if [ $# -ne 0 ]; then
	exit 1
fi


bin="$HOME/bin"
if [ ! -e $bin ]; then
       mkdir $bin
fi
for i in $(find $(pwd) -name "*.exe"); do
	mv $i $bin
	if [ $? -eq 0 ]; then
		echo "Se movio $i a $bin"
	else
		echo "No se pudo mover $i a $bin"
	fi
done
exit 0
