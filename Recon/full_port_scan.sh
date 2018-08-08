# Download masscan:https://github.com/robertdavidgraham/masscan/
# Make sure you are in the masscan-master directory
# Look no further, this is script utilizes Mass Scan and takes the port numbers found and does an in depth scan via Nmap
# Author Cody Bernardy

echo "Don't forget to chmod +x"
echo "Script requires that you are in the masscan directory, see script comments"
echo "Enter target ip(s)"
read ip

#Runs masscan on specified target
sudo bin/masscan -p0-65535 -Pn $ip --rate 100000 > output1.txt

#Cuts output in output1.txt to the port numbers
cat output1.txt | cut -d ' ' -f 4 | cut -d '/' -f 1| xargs| sed -e 's/ /,/g' > output.txt

#Little Clean up
rm output1.txt

#Assigns the data in output.txt to a variable
ports=$(cat output.txt)

#Nmap the ports and target(s)

nmap -A -p$ports $ip
