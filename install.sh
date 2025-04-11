#!/bin/bash

# YASIN-FB-REPORT-TOOL
# Facebook Copyright Reporting Toolkit via Termux + Tor
# Created by YASIN | HACKER

GREEN='\033[1;32m'
NC='\033[0m'

clear
echo -e "${GREEN}[+] Initializing YASIN FB Report Tool...${NC}"

# Step 1: Update Packages
pkg update -y && pkg upgrade -y

# Step 2: Install required packages
pkg install tor curl git w3m -y

# Step 3: Start tor service
echo -e "${GREEN}[+] Starting TOR...${NC}"
tor &  # Start Tor in background
sleep 10

# Step 4: Show spoofed IP
echo -e "${GREEN}[+] Checking spoofed IP address...${NC}"
curl --socks5 127.0.0.1:9050 https://ipinfo.io

# Step 5: Open Facebook copyright form
echo -e "${GREEN}[+] Opening Facebook Copyright Form...${NC}"
w3m https://www.facebook.com/help/contact/208282075858952

# Step 6: Template Output
echo -e "${GREEN}[+] Sample DMCA Template:${NC}"
cat <<EOF

Your Name: [Enter Your Full Name]
Your Email: [Your email]
Your Country: USA
Your Address: [Any USA address]

Original Work Link:
https://facebook.com/yourpost

Infringing Link:
https://facebook.com/stolenpost

Statement:
I believe in good faith that the use of the content described above is not authorized...

Signed:
[Your Name]
Date: $(date +%Y-%m-%d)

EOF
