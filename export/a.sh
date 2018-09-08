
echo "a.sh:A="$A
B=3
echo "a.sh:B="$B

export B=5 #b.sh can use value of B

./b.sh
