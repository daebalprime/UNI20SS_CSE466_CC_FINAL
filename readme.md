# Cloud Computing Final Project

## Team Members

|  |  |
|--|--|
|***Taesu Kim***|start0821@unist.ac.kr|
|***Hyungchan Ham***|hyeongchanham7@gmail.com|
|***Daeyeon Kim***|daebalprime@gmail.com|
| | |

## Parameters
- Compulsory Parameters
	- HDFS Replication Factor
	- block size of HDFS
	- CPU and memory configurations for mapred tasks(mapred.xml? 3).
- Additional Parameters 
	- mapred.compress.map.output:
		- output을 압축해서 disk에 저장. 데이터 전송 및 저장에 유리할 듯.
		- 압축하는 시간이 얼마나 유의미할지 찾아봐야... 
	- mapred.tasktracker.map/reduce.tasks.maximum
	- mapred.reduce.parallel.copies
		- number of threads that copy map output to the reducer.
	- mapred.map.min/maxsplitsize
	- io.sort.factor + io.sort.mb
		- input이 크면, disk에 저장이 되는데 이거 자체가 overhead.
		- Disk access와 연관이 있을 듯
	- io.file.buffer.size
### Suggestion.
- ***[Fair Scheduler](https://hadoop.apache.org/docs/current/hadoop-yarn/hadoop-yarn-site/FairScheduler.html) VS [Capacity Scheduler](https://hadoop.apache.org/docs/current/hadoop-yarn/hadoop-yarn-site/CapacityScheduler.html)***
- [Shuffle Tuning](https://m.blog.naver.com/PostView.nhn?blogId=pdc222&logNo=220732616451&proxyReferer=https:%2F%2Fwww.google.com%2F)
- Mapreduce number of task
