#!/bin/bash
echo "number"
read marks

if [ $marks -lt 33 ]; then
    echo "fail"
elif [ $marks -lt 50 ]; then
    echo "tgird class"
elif [ $marks -lt 60 ]; then
    echo "second class"
    elif [ $marks -lt 75 ]; then
    echo "first class"
else
    echo "distinction"
fi

echo "end"