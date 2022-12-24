#!/bin/bash
#touch `date +%d-%b-%Y-%H`h.txt
data=$(date +"%H")
echo "$data" > `date +%d-%b-%Y-%H`h.txt
