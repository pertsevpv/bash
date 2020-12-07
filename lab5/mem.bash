#!/bin/bash
>report.log
>full_report.log
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
		echo $len >> report.log
		echo $len >> full_report.log
		top -n 1 -b | awk 'NR == 4 { print $0 }' >> full_report.log
		top -n 1 -b | awk 'NR == 5 { print $0 }' >> full_report.log
		top -n 1 -b | grep -w "mem.bash" >> full_report.log
		top -n 1 -b | awk 'NR >= 8 && NR <= 12 { print $0 }' >> full_report.log
		echo >> full_report.log
	fi
done
