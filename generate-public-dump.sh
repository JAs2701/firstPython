#!/bin/sh
# path
export dir_home=$(dirname $0)
# source 
export data=$dir_home/dump.ttl
export sparql=$dir_home/sparql
export output_dir=$dir_home
echo "================ Delete entities & declarations ================"
count=0
for query in  $sparql/*.ru
do
	echo "Sparql Query: " $query
	if [ $count -eq 0 ]
	then
		update --data $data --update $query --dump >> $output_dir/public-dump.ttl
		count=$((count + 1))		
	else
		update --data $output_dir/public-dump.ttl --update $query --dump >> $output_dir/tmp_public-dump.ttl
		# delete file
		rm $output_dir/public-dump.ttl
		#rename file
		mv $output_dir/tmp_public-dump.ttl $output_dir/public-dump.ttl
	fi	
done
