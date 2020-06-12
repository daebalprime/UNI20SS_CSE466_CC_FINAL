#!/bin/bash

function xml_save() {
	curl http://114.70.14.158:8088/ws/v1/cluster/apps/application_$(hdfs dfs -ls /app-logs/root/logs | tail -1 | grep "[0-9]\{5,\}\_[0-9]\{4,\}$" -o) > $1
}

PROPERTY=`echo $1 | sed "s/_[^_]*$//g" | sed "s/VAR_//g"`
VALUE=`echo $1 | grep -oh "_[^_]*$" | sed s/_//`
CONFIG_DIR=${HADOOP_HOME}/etc/hadoop
mkdir $PROPERTY
cd $PROPERTY
mkdir $VALUE
cd $VALUE
cp ${CONFIG_DIR}/hdfs-site.xml ./hdfs-site.xml
cp ${CONFIG_DIR}/mapred-site.xml ./mapred-site.xml
cp ${CONFIG_DIR}/core-site.xml ./core-site.xml
for i in 1 2 3
do

	#yarn jar ${HADOOP_HOME}/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.7.6.jar pi 16 2000000000 1>pi${i}.log 2>pi${i}.err
	#xml_save pi${i}.json
	#TODO add example task command with following format

	#yarn jar ${HADOOP_HOME}/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.7.6.jar bbp 1 100000 20 bbp_dir 1>bbp${i}.log 2>bbp${i}.err
	#xml_save bbp${i}.json

	#yarn jar ${HADOOP_HOME}/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.7.6.jar pentomino pent_out -depth 5 -height 2 -width 2 1>pent${i}.log 2>pent${i}.err
	#xml_save pent${i}.json
	#hdfs dfs -rm -r /user/root/pent_out


	#yarn jar ${HADOOP_HOME}/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.7.6.jar sudoku sudoku_sample/puzzle.dta 1>sudoku${i}.log 2>sudoku${i}.err
	#xml_save sudoku${i}.json

	yarn jar ${HADOOP_HOME}/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.7.6.jar randomtextwriter -D mapreduce.randomtextwriter.totalbytes=10737418240 randomtext

	#yarn jar ${HADOOP_HOME}/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.7.6.jar wordcount randomtext wordcount_output 1>wordcount${i}.log 2>wordcount${i}.err
	#xml_save wordcount${i}.json

	#hdfs dfs -rm -r wordcount_output

	yarn jar ${HADOOP_HOME}/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.7.6.jar grep randomtext grep_output "\S+" 1>greped${i}.log 2>greped${i}.err
	curl http://114.70.14.158:8088/ws/v1/cluster/apps/application_$(hdfs dfs -ls /app-logs/root/logs | tail -2 | head -1 | grep "[0-9]\{5,\}\_[0-9]\{4,\}$" -o) > grep_search${i}.json
	xml_save grep_sort${i}.json
	hdfs dfs -rm -r grep_output

	hdfs dfs -rm -r randomtext

	# TODO  sort 다시 돌리기

	#yarn jar ${HADOOP_HOME}/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.7.6.jar randomwriter -D mapreduce.randomwriter.totalbytes=10737418240 random
	#yarn jar ${HADOOP_HOME}/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.7.6.jar sort random random_sorted 1> sorted${i}.log 2>sorted${i}.err
	#xml_save sorted${i}.json

	#hdfs dfs -rm -r random
	#hdfs dfs -rm -r random_sorted
	hdfs dfs -rm -r "/*"

	
done
cd ../..
