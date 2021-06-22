#!/bin/bash


end=50

for a in $(seq 47 $end)
do
	for b in $(seq 47 $end)
	do
		for c in $(seq 47 $end)
		do
			$HOME/singular/testpoly.sh $a $b $c
		done
	done
done
