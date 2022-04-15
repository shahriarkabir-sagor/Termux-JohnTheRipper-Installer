#!/data/data/com.termux/files/usr/bin/bash
RED='\033[0;31m'
LIGHTRED='\033[1;31m'
GREEN='\033[0;32m'
LIGHTGREEN='\033[1;32m'
ORANGE='\033[0;33m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
LIGHTBLUE='\033[1;34m'
NC='\033[0m' # No Color

echo -e "${YELLOW}Checking if all package are updated or not ${NC}"
pkg up -y
echo -e "${GREEN}Installing dependencies${NC}"
pkg install git clang perl build-essential make -y
echo -e "${GREEN}Started cloning core project${NC}"
git clone git://github.com/magnumripper/JohnTheRipper -b bleeding-jumbo john
echo -e "${BLUE}Navigating to the main folder${NC}"
cd john/src/
clear
echo -e "
${BLUE}**********************************************
*${NC}${LIGHTGREEN}    _________.__             ____  __.__    ${BLUE}*
*${NC}${LIGHTGREEN}   /   _____/|__|           |    |/ _|__|   ${BLUE}*
*${NC}${LIGHTGREEN}   \_____  \ |  |   ______  |      < |  |   ${BLUE}*
*${NC}${LIGHTGREEN}   /        \|  |  /_____/  |    |  \|  |   ${BLUE}*
*${NC}${LIGHTGREEN}  /_______  /|__|           |____|__ \__|   ${BLUE}*
*${NC}${LIGHTGREEN}          \/     ${RED}Encoder's YT${LIGHTGREEN}       \/      ${BLUE}*
*${NC}${LIGHTGREEN}                                            ${BLUE}*
*${NC}${LIGHTGREEN}                                            ${BLUE}*
*${NC}${LIGHTBLUE}  johnTheRipper installer by Encoder's YT   ${BLUE}*
**********************************************${NC}
"
echo -e "${GREEN}Started configuration, It may took some time${NC}"
sleep 0.1
echo -e "${GREEN}Configuring core engine, please wait ...${NC}"
./configure
clear
echo -e "${GREEN}Configuration Completed. Now starting final proccess it will took approximately 5-10 min"
echo -e "Started final process, please wait...${NC}"
make -s clean && make -sj4
cd ../../
echo -e "${GREEN}Process completed. You can check it by giving the following command ${LIGHTBLUE}./john/run/john --help${NC}"
