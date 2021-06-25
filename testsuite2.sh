#!/bin/bash


end=50

for a in $(seq 8 9)
do
	for b in $(seq 4 5)
	do
		for c in $(seq 4 5)
		do
			$HOME/singular/cmppoly.sh $a $b $c
		done
	done
done
