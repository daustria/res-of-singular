#!/bin/bash

# Test conjecture 0.3

# arguments: ./testc3.sh k n m
if [[ $# -ne 1 ]]; then
	echo "usage: $0 k n m"
	exit
fi
#construct the polynomial to be used in the singular program
polynomial=$1

echo "Testing $polynomial"
outputfile="$1.out"

program="ring A = (0, complex),x(0..$k),dp;
ideal J = $polynomial;
list l = resolve(J);
presentTree(l);
print(l);
quit;
"

yes | Singular -q --no-warn -c "LIB \"resolve.lib\"; $program" | tee $HOME/singular/conj03tests/$outputfile
