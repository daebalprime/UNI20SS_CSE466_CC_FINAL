# TROUBLESHOOTING
## DataNode executing fail
### error message
``` log
2020-05-25 04:46:51,635 WARN org.apache.hadoop.hdfs.server.common.Storage: Failed to add storage directory [DISK]file:/tmp/hadoop-root/dfs/data/
java.io.IOException: Incompatible clusterIDs in /tmp/hadoop-root/dfs/data: namenode clusterID = CID-45214c1e-4c44-4096-b338-79353672bb80; datanode clusterID = CID-b2850d5f-7fa4-44c8-bfed-045f33f34951
        at org.apache.hadoop.hdfs.server.datanode.DataStorage.doTransition(DataStorage.java:777)
        at org.apache.hadoop.hdfs.server.datanode.DataStorage.loadStorageDirectory(DataStorage.java:300)
        at org.apache.hadoop.hdfs.server.datanode.DataStorage.loadDataStorage(DataStorage.java:416)
        at org.apache.hadoop.hdfs.server.datanode.DataStorage.addStorageLocations(DataStorage.java:395)
        at org.apache.hadoop.hdfs.server.datanode.DataStorage.recoverTransitionRead(DataStorage.java:573)
        at org.apache.hadoop.hdfs.server.datanode.DataNode.initStorage(DataNode.java:1393)
        at org.apache.hadoop.hdfs.server.datanode.DataNode.initBlockPool(DataNode.java:1358)
        at org.apache.hadoop.hdfs.server.datanode.BPOfferService.verifyAndSetNamespaceInfo(BPOfferService.java:313)
        at org.apache.hadoop.hdfs.server.datanode.BPServiceActor.connectToNNAndHandshake(BPServiceActor.java:216)
        at org.apache.hadoop.hdfs.server.datanode.BPServiceActor.run(BPServiceActor.java:637)
        at java.lang.Thread.run(Thread.java:748)
```
### solution
remove hadoop data file

## Namenode not connected, Datanode not connected
### Solution
``` bash
systemctl stop filewalld
```
## ACCEPTED: waiting for AM container to be allocated, launched and register with RM.
### error message
***master:8088/cluster/app/application_####***
``` log
User:	root
Name:	random-text-writer
Application Type:	MAPREDUCE
Application Tags:	
YarnApplicationState:	ACCEPTED: waiting for AM container to be allocated, launched and register with RM.
Queue:	default
FinalStatus Reported by AM:	Application has not completed yet.
Started:	Mon May 25 14:42:45 +0900 2020
Elapsed:	26sec
Tracking URL:	ApplicationMaster
Diagnostics:	
```
### Solution
Resource Manager cannot connect to slave nodes because of UNKNONW HOSTS
ADDED hostname of slaves node to `/etc/hosts`
