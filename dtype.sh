a=10
b=20
c=pdeep
echo "$a+$b"
echo "$(($a+$b+$c))"

declare -i x=5
x=x+10
echo "print :$x"

#array
f=("beer" "rum" "vodka")
echo "all: ${f[@]}"
echo "all: ${f[0]}"
echo "all: ${f[1]}"