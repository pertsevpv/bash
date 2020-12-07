#!/bin/bash
N=$1
arr=()
len=0
while true; do
	for i in 0 1 2 3 4 5 6 7 8 9; do
		arr[$len]=$i
		let len+=1
		if [[ $N -le $len ]]; then
			exit
		fi
	done
done
