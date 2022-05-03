#!/bin/bash

	for i in {1..7}
	do
	./hw2 < tests/t${i}.in > new_out.txt
	
	DIFF=$(diff tests/t${i}.out new_out.txt)
		
		if [ "$DIFF" == "" ] 
		then
			echo "-- Test t$i passed :D --"
		else
			echo "-- Test t$i FAILED :'( --"
			break
		fi
	done
	rm new_out.txt