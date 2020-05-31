#!/bin/bash

mkdir $1
for i in 1 2 3
do

	yarn jar ${HADOOP_HOME}/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.7.6.jar pi 16 10000000 1>$1/pi${i}.log 2>$1/pi${i}.err

	#TODO add example task command with following format

	yarn jar ${HADOOP_HOME}/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.7.6.jar bbp 4 20 5 bbp_dir 1>$1/bbp${i}.log 2>$1/bbp${i}.err

	yarn jar ${HADOOP_HOME}/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.7.6.jar pentomino pent_out -depth 5 -height 2 -width 2 1>$1/pent${i}.log 2>$1/pent${i}.err
	hdfs dfs -rm -r /user/root/pent_out


	time yarn jar ${HADOOP_HOME}/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.7.6.jar sudoku sudoku_sample/puzzle.dta 1>$1/sudoku${i}.log 2>$1/sudoku${i}.err

	# yarn jar ${HADOOP_HOME}/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.7.6.jar randomwriter /randomwords
	# yarn jar ${HADOOP_HOME}/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.7.6.jar wordcount /randomwords /wordcount_output 1>$1/wordcount${i}.log 2>$1/wordcount${i}.err
	# hdfs dfs -rm -r /wordcount_output
	# hdfs dfs -rm -r /randomwords

	
done
