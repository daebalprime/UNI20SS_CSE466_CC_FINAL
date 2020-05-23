#!/usr/bin/zsh

VAR_REPLICATION_FACTOR = 1
VAR_BLOCKSIZE = 128m

CONFIG_DIR = /root/src/hadoop-2.7.6/etc/hadoop/hdfs-site.xml

dummy:

all: dummy
	sed 's/VAR_BLOCKSIZE/$(VAR_BLOCKSIZE)/; s/VAR_REPLICATION_FACTOR/$(VAR_REPLICATION_FACTOR)/' \
	 ./hdfs-site-seed.xml > ./hdfs-site-replaced.xml 
	cp ./hdfs-site-replaced.xml $(CONFIG_DIR)/hdfs-site.xml

# example: make all VAR_BLOCKSIZE=1
# DONT: make all VAR_BLOCKSIZE = 1
# DON'T ADD SPACE BETWEEN VARIABLE, =, VALUE.

#TODO : 
#1. ADD MORE PARAMS
#2. RUN, GET REPORT, PARSING, SAVE NUMBERS WITH COPY OF CONFIGS
#3. 3TIMES REPEAT
#4. GET JOB STATISTICS.
