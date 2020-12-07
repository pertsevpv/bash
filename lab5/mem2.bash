#!/bin/bash
>report2.log
>full_report2.log
arr=()
len=0
step=0
while true; do
	for i in 0 1 2 3 4 5 6 7 8 9; do
		arr[$len]=$i
		let len+=1
	done
	
	let step+=1
	if [[ $step -eq 100000 ]]; then
		step=0
		echo $len >> report2.log
		echo $len >> full_report2.log
		top -n 1 -b | awk 'NR == 4 { print $0 }' >> full_report2.log
		top -n 1 -b | awk 'NR == 5 { print $0 }' >> full_report2.log
		top -n 1 -b | grep -w "mem2.bash" >> full_report2.log
		top -n 1 -b | awk 'NR >= 8 && NR <= 12 { print $0 }' >> full_report2.log
		echo >> full_report2.log
	fi
done
