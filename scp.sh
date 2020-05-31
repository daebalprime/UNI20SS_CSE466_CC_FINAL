for var in "$@"
do
	DIR="$(cd $(dirname $var)&& pwd)"
	scp -P32222 -r $var root@slave1:$DIR
	scp -P32222 -r $var root@slave2:$DIR
done
