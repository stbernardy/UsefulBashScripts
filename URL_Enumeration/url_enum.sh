#!/bin/bash

echo "What website did you want to scrape for?"
read target

for name in $(cat enums.txt); do
	host $name.$target| grep "has address"| cut -d " " -f1,4
done

