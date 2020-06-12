hdfs dfs -rm -r "/*"
ssh root@slave1 -p 32222 'rm -rf /opt/hadoop/hadoop/hdfs/datanode/*'
ssh root@slave2 -p 32222 'rm -rf /opt/hadoop/hadoop/hdfs/datanode/*'

stop-all.sh
start-dfs.sh

