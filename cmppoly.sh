#!/bin/bash

# Compute the tree of the polynomial x^a + y^b*z^c in singular
if [[ $# -ne 3 ]]; then
	echo "Usage: $0 a b c"
	exit
fi

a=$1
b=$2
c=$3

# bound=$(($a + $b + $c))
bound=50
library="resolve.lib"

output_file="$a-$b-$c.out"

yes | Singular -q --no-warn -c "LIB \"$library\"; ideal J = x$a + y$b*z$c; list out = resolve(J); presentTree(out); quit;" | tee $HOME/singular/villamayor-tests/$output_file
