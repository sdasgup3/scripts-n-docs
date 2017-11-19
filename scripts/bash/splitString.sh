a=$(grep "code" ~/Junk/x | tr -d '\n')
b=$(grep "elapsed" ~/Junk/x | tr -d '\n')
c=$(grep "name" ~/Junk/x | tr -d '\n')

IFS=',' read -r -a array_a <<< "$a"
IFS=',' read -r -a array_b <<< "$b"
IFS=',' read -r -a array_c <<< "$c"


for ((i=0,j=0,k=0;i<140;i++,j++,k++)); do
  echo "${array_a[$i]},${array_b[$j]},${array_c[$k]}";
done
