#!/bin/bash

# Test conjecture 0.3

# arguments: ./testc3.sh k n m
if [[ $# -ne 3 ]]; then
	echo "usage: $0 k n m"
	exit
fi

k=$1;
n=$2;
m=$3;

#construct the polynomial to be used in the singular program
polynomial="x(0)^$m" 
prod=$(($n*$m))
for i in $(seq 1 $k)
do
	polynomial+="+x($i)^$prod"
done

outputfile="$HOME/singular/conj03tests/bm-$k-$n-$m.out"

program="ring A = (0, complex),x(0..$k),dp;
ideal J = $polynomial;
print(J[1]);
dfs_resolve(J, 30);
quit;
"

rm $outputfile
yes | Singular -q --no-warn -c "LIB \"resolvebm.lib\"; $program" | tee $outputfile
