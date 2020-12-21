net stop dnscache
timeout /t 5
net start > updated.txt
fc start.txt updated.txt > delta.txt
net start dnscache