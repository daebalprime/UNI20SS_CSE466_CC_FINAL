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

### Quick links
- ***[HDFS](http://114.70.14.158:50070/dfshealth.html#tab-overview)
- ***[Hadoop Status](http://114.70.14.158:50070/dfshealth.html#tab-overview)

### TODO

# Workflow
1. configuration 별로 하둡 세팅하고, 어플리케이션 실행해서 로그파일[1] 생성

[1] 로그파일 생성 : 실행한 어플리케이션의 아이디를 확인하고, xml파일 얻기.

2. 로그파일 파싱 -> json으로 얻기[2] -> application 3번 평균[3] -> configure 별로 application 결린 시간 비교[4].
[2] xml, output 파싱


3. 이걸 기반으로 레포트


