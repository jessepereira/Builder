#!/bin/bash
#touch `date +%d-%b-%Y-%H`h.txt
data=$(date +"%H")
echo "$data" > /home/jessepereira02/Builder/app/files/`date +%d-%b-%Y-%H`h.txt

gcloud storage cp /home/jessepereira02/Builder/app/files/`date +%d-%b-%Y-%H`h.txt gs://36eac891354952e8-bucket-tfstate
