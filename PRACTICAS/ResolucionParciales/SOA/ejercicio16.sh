#!/bin/bash
if [ $# -lt 1 ]; then
	exit 1
fi
cant=0
for i in $*;do
	if [ ! -e $i ]; then
		cant=$(expr $cant + 1)
	elif [ -f $i ]; then
		gzip $i
	else
		if [ -d $i ] && [ -r $i ]; then
			tar -czf parcial.tar.gz $i
		else
			if [ -d $i ] && [ -w $i ]; then
				rm -r $i
			fi
		fi
	fi
done
echo "Cantidad inexistentes: $cant"
exit 0
