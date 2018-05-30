#!/bin/sh

echo "Copy project to remote system          [..]"
scp -r Project pi@192.168.178.39:Documents/
echo "Copy project to remote system          [OK]"
echo "Connect to remote system, make and run [..]"
ssh pi@192.168.178.39 "cd Documents/Project/; make; ./StarHunter"
echo "Connect to remote system, make and run [..]"
