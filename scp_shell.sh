for i in BLOCKSIZE BUFFER_SIZE CPU_VCORES_MAP CPU_VCORES_REDUCE MAXIMUM_TASKS_MAP MAXIMUM_TASKS_REDUCE MEMORY_MAP MEMORY_REDUCE OUTPUT_COMPRESS REPLICATION_FACTOR SORT_FACTOR SORT_MB YARN_VCORES YARN_MEMORY
do
	cd $i
	list_dir=`ls|grep -v '_tmp$'`
	for dir in $list_dir
	do
		cd $dir
		CURDIR=`pwd`
		for file in 1 2 3
		do
			FILE=${CURDIR}/sorted$file.json
			echo $FILE
			cat $FILE
			echo "\n"
		done
		cd ..
	done
	cd ..
done
