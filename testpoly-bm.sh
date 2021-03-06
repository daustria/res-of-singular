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
library="$HOME/singular/resolvebm.lib"

output_file="$a-$b-$c.out"

testfile=$HOME/singular/tests/$output_file

# time the resolution
start=`date +%s`
Singular -q --no-warn -c "LIB \"$library\"; poly f = x$a + y$b*z$c; dfs_resolve(ideal(f), deg(f)); quit;" | tee $testfile
end=`date +%s`

runtime=$((end-start))

# next remove the irrelevant lines from the output

sed -i '/quotient/d' $testfile
sed -i '/iteration/d' $testfile

# append the time taken to the output file

echo "time taken: $runtime" | tee -a $testfile




