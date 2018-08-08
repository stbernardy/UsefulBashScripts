
 #/bin/bash

echo "We will attempt to do a zone transfer on a specified domain"

echo "Only do this if you have written permission from the owner of the Domain"

echo "Enter in a URL"
read url

host -t ns $url |grep ns |cut -d" " -f4  >output.txt

for dns in $(cat output.txt); do
        host -l $url $dns
done

rm output.txt
