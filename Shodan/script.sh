#!/bin/bash

echo "Enter in search term"
read searchTerm

shodan search --fields ip_str,port,org,hostnames $searchTerm > output.txt
cat output.txt
