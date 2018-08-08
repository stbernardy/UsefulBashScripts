#!/bin/bash

echo "Enter in the hostname/IP"
read target

echo "Enter in any arguments"
echo "-sn for ping sweep"
echo "-sS for TCP SYN"
echo "-p for specific ports"
echo "-sU for UDP scan and -sT for TCP scan"
echo "-O for OS detection"
echo "-A for an huge ass read-out"

read argument

#This will reset ALL iptable rules
iptables -Z && iptables -F

#Measure incoming traffic to $target
iptables -I INPUT 1 -s $target -j ACCEPT

#Measure outgoing traffie to $target
iptables -I OUTPUT 1 -d $target -j ACCEPT

nmap $argument $target

echo "Check output.txt for total number of traffic sent and recieved"

iptables -vn -L >output.txt

