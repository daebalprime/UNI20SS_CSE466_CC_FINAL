#!/bin/bash

VAR_REPLICATION_FACTOR = 1 
# FIXME BLOCKSIZE value should be pure integer not including M,G,k as postfix
# VAR_BLOCKSIZE = 128m
VAR_BLOCKSIZE = 134217728
VAR_MEMORY_REDUCE = 1024
VAR_MEMORY_MAP = 1024
VAR_CPU_VCORES_REDUCE = 1
VAR_CPU_VCORES_MAP = 1
VAR_OUTPUT_COMPRESS = false
VAR_MAXIMUM_TASKS_MAP = 2
VAR_MAXIMUM_TASKS_REDUCE = 2
VAR_SORT_FACTOR = 10
VAR_SORT_MB = 100
VAR_BUFFER_SIZE = 4096

# VAR_REPLICATION_FACTOR = 1 
VRF = 1 2 3
# VAR_BLOCKSIZE = 128m
VB = 67108864 134217728 268435456
# VAR_MEMORY_REDUCE = 1024
# VMR = 512 1024 2048
VMR = 2048
# VAR_MEMORY_MAP = 1024
VMM = 512 1024 2048
# VAR_CPU_VCORES_REDUCE = 1
VCVR = 1 2 3 
# VAR_CPU_VCORES_MAP = 1
VCVM = 1 2 3
# VAR_OUTPUT_COMPRESS = false
VOC = false true
# VAR_MAXIMUM_TASKS_MAP = 2
VMTM = 2 4 8
# VAR_MAXIMUM_TASKS_REDUCE = 2
VMTR = 2 4 8
# VAR_SORT_FACTOR = 10
# The number of streams to merge at once while sorting files. This determines the number of open file handles.
VSF = 5 10 20 
# VAR_SORT_MB = 100
# The total amount of buffer memory to use while sorting files, in megabytes. By default, gives each merge stream 1MB, which should minimize seeks.
VSM = 50 100 200
# VAR_BUFFER_SIZE = 4096
# The size of buffer for use in sequence files. The size of this buffer should probably be a multiple of hardware page size (4096 on Intel x86), and it determines how much data is buffered during read and write operations.
VBS = 2048 4096 8192


PARAMETER_ID = ""

CONFIG_DIR = /root/src/hadoop-2.7.6/etc/hadoop


test: 
	# TODO BLOCKSIZE REPLICATION sort, grep 돌리
	## due to storage shortage, only 2 replication factor is available
	#$(foreach var,$(VRF), make all VAR_REPLICATION_FACTOR=$(var) PARAMETER_ID=VAR_REPLICATION_FACTOR_$(var);)

	#$(foreach var,$(VB), make all VAR_BLOCKSIZE=$(var) PARAMETER_ID=VAR_BLOCKSIZE_$(var);)
	$(foreach var,$(VMR), make all VAR_MEMORY_REDUCE=$(var) PARAMETER_ID=VAR_MEMORY_REDUCE_$(var);)
	$(foreach var,$(VMM), make all VAR_MEMORY_MAP=$(var) PARAMETER_ID=VAR_MEMORY_MAP_$(var);)
	$(foreach var,$(VCVR),make all VAR_CPU_VCORES_REDUCE=$(var) PARAMETER_ID=VAR_CPU_VCORES_REDUCE_$(var);)
	$(foreach var,$(VCVM),make all VAR_CPU_VCORES_MAP=$(var) PARAMETER_ID=VAR_CPU_VCORES_MAP_$(var);)
	$(foreach var,$(VOC), make all VAR_OUTPUT_COMPRESS=$(var) PARAMETER_ID=VAR_OUTPUT_COMPRESS_$(var);)
	$(foreach var,$(VMTM),make all VAR_MAXIMUM_TASKS_MAP=$(var) PARAMETER_ID=VAR_MAXIMUM_TASKS_MAP_$(var);)
	$(foreach var,$(VMTR),make all VAR_MAXIMUM_TASKS_REDUCE=$(var) PARAMETER_ID=VAR_MAXIMUM_TASKS_REDUCE_$(var);)
	$(foreach var,$(VSF), make all VAR_SORT_FACTOR=$(var) PARAMETER_ID=VAR_SORT_FACTOR_$(var);)
	$(foreach var,$(VSM), make all VAR_SORT_MB=$(var) PARAMETER_ID=VAR_SORT_MB_$(var);)
	$(foreach var,$(VBS), make all VAR_BUFFER_SIZE=$(var) PARAMETER_ID=VAR_BUFFER_SIZE_$(var);)

# all:
# 	echo $(PARAMETER_ID)
all: dummy
	sed 's/VAR_BLOCKSIZE/$(VAR_BLOCKSIZE)/; s/VAR_REPLICATION_FACTOR/$(VAR_REPLICATION_FACTOR)/' \
	 ./hdfs-site-seed.xml > ./hdfs-site-replaced.xml 
	sed 's/VAR_MEMORY_REDUCE/$(VAR_MEMORY_REDUCE)/; s/VAR_MEMORY_MAP/$(VAR_MEMORY_MAP)/; s/VAR_CPU_VCORES_REDUCE/$(VAR_CPU_VCORES_REDUCE)/; s/VAR_CPU_VCORES_MAP/$(VAR_CPU_VCORES_MAP)/; s/VAR_OUTPUT_COMPRESS/$(VAR_OUTPUT_COMPRESS)/; s/VAR_MAXIMUM_TASKS_MAP/$(VAR_MAXIMUM_TASKS_MAP)/; s/VAR_MAXIMUM_TASKS_REDUCE/$(VAR_MAXIMUM_TASKS_REDUCE)/; s/VAR_SORT_FACTOR/$(VAR_SORT_FACTOR)/; s/VAR_SORT_MB/$(VAR_SORT_MB)/' \
	 ./mapred-site-seed.xml > ./mapred-site-replaced.xml
	sed 's/VAR_BUFFER_SIZE/$(VAR_BUFFER_SIZE)/' \
	./core-site-seed.xml > ./core-site-replaced.xml
	cp ./hdfs-site-replaced.xml $(CONFIG_DIR)/hdfs-site.xml
	cp ./mapred-site-replaced.xml $(CONFIG_DIR)/mapred-site.xml
	cp ./core-site-replaced.xml $(CONFIG_DIR)/core-site.xml
	# cat ./mapred-site-replaced.xml
	./scp.sh $(CONFIG_DIR)/hdfs-site.xml $(CONFIG_DIR)/mapred-site.xml $(CONFIG_DIR)/core-site.xml
	./restart-all.sh
#	./run-tasks.sh $(PARAMETER_ID)
	./run-tasks2.sh $(PARAMETER_ID)


# example: make all VAR_BLOCKSIZE=1
# DONT: make all VAR_BLOCKSIZE = 1
# DON'T ADD SPACE BETWEEN VARIABLE, =, VALUE.

dummy:
#TODO : 
#1. ADD MORE PARAMS
#2. RUN, GET REPORT, PARSING, SAVE NUMBERS WITH COPY OF CONFIGS
#3. 3TIMES REPEAT
#4. GET JOB STATISTICS.


# io.sort.factor + io.sort.mb
# mapred.compress.map.output
# mapred.tasktracker.map/reduce.tasks.maximum
# io.file.buffer.size 4096
