#!/bin/bash


end=50

for a in $(seq 50 $end)
do
	for b in $(seq 48 50)
	do
		for c in $(seq 48 50)
		do
			$HOME/singular/testpoly.sh $a $b $c
		done
	done
done
