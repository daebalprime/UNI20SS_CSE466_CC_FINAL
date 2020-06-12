for i in `ls $1`
do
	echo $i
	python regex.py $1/$i/${2}.err | grep tasks
done
