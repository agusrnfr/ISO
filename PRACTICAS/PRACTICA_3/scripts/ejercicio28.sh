#!/bin/bash
if [ $# -ne 1 ]; then
	exit 1
fi

if ! [ -d $1 ]; then
	echo "ERROR 4"
	exit 4
else
	cont=0
	for i in $(ls -l $1); do
		if [ -f $1/$i ]; then
		       if [ -w $1/$i ] && [ -r $1/$i ]; then
				let cont++
			fi
		fi
	done
	echo "Cantidad: $cont"
fi
exit 0
