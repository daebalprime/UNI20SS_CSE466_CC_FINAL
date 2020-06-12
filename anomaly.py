#!/bin/bash
for ((i=0;;));
do
	node_status=`yarn node -list 2>/dev/null|sed -n '3p;4p' | awk -v key=elec '{print $4}'`
	let "a=0"
	for k in $node_status
	do
		a=` expr $a + $k`
	done
	if (($a<5));then
		if (($i>=5));then
			mail -r hadoop@hadoop.com -s "hadoop WARNING" ktaesu0821@gmail.com <<< "http://114.70.14.158:8088/cluster"
			mail -r hadoop@hadoop.com -s "hadoop WARNING" hyeongchanham7@@gmail.com <<< "http://114.70.14.158:8088/cluster"
			i=0
		else
			i=`expr $i + 1`
		fi
	else
		i=0
	fi
	
	sleep 60
done

