#!/bin/bash

#Results are outputted to results.txt
echo "Enter in the IP/IP Range you want to scan"
read ip

nmap -sU --open -p 161 $ip --open -oG results.txt

