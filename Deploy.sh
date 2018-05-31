#!/bin/sh

#Constants
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'
BOLD=$(tput bold)
NORMAL=$(tput sgr0)

#Functions
END(){
  if [ $1 -eq 0 ]; then
    echo ${GREEN}${BOLD}"EXIT SUCCESS"
    echo ${NC}${NORMAL}
    exit
  else
    echo
    echo ${RED}${BOLD}"EXIT FAILURE"
    echo ${NC}${NORMAL}
    exit
  fi
}

ERROR(){
  echo
  echo ${RED}${BOLD}"Error: "
  echo ${NC}${NORMAL}$1
  END 1
}

#Check arguments
if [ $# -eq 1 ]; then
  if [[ $1 =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    echo "Using ip: " $1
  else
    ERROR "Argument should be IP-address of remote system!"
  fi
else
    ERROR "Argument should be IP-address of remote system!"
fi

#Copy to remote
echo ${NC}${NORMAL}
echo "Copy project to remote system          [${BOLD}..${NORMAL}]"
if ! scp -o ConnectTimeout=5 -r Project pi@$1:Documents/; then
  ERROR "Connection to remote system failed!"
fi
echo "Copy project to remote system          [${GREEN}${BOLD}OK${NC}${NORMAL}]"
echo ${NC}${NORMAL}

#Make and run on remote system
echo ${NC}${NORMAL}
echo "Connect to remote system               [${BOLD}..${NORMAL}]"
if ! ssh -o ConnectTimeout=5 pi@$1 "cd Documents/Project/; make; ./StarHunter"; then
  ERROR "Connection to remote system failed!"
fi
echo "Connect to remote system, make and run [${GREEN}${BOLD}OK${NC}${NORMAL}]";
echo ${NC}${NORMAL}

#End successfull
END 0
