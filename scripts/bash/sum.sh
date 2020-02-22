file=$1

echo -n "sum: "
echo  \(`paste -sd+ $file`\)  | bc -l
echo -n "mean: "
echo  \(`paste -sd+ $file`\)  / `wc -l $file | cut -d ' ' -f1` | bc -l 
