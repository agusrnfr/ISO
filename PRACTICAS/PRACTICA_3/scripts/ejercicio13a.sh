#!/bin/bash
if [ $# -ne 0 ]; then
	exit 1
else
	num=0
	while [ $num -ne 100 ]; do
		num=$(expr $num + 1)
		echo "Numero: $num"
		echo "Cuadrado: $(expr $num \* $num)"
	done
fi
exit 0
