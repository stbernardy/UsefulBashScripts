#!/usr/bin/env bash


echo "Enter in your target address"
read target 

echo "Enter in the filename you want the addresses to be saved under"
read filename
$(wget $target)
$(cat index.html | grep -o 'http://[^"]*' | cut -d  "/" -f 3 | sort -u > $filename)
$(rm index.html)
for url in $(cat $filename); do host $url; done | grep "has address" | cut -d " " -f 4 | sort -u

echo "We will now nmap the host $target"
nmap $target
echo "Now we will nmap the scraped hosts in $target"
nmap -oN output.txt -iL $filename
