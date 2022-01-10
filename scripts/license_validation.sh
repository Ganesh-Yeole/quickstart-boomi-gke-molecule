#!/bin/bash

wget https://raw.githubusercontent.com/Ganesh-Yeole/quickstart-boomi-gke-molecule/main/scripts/requirements.txt
#wget https://raw.githubusercontent.com/Ganesh-Yeole/quickstart-boomi-gke-molecule/main/scripts/license_validation.py

pip install -t . -r ./requirements.txt

result=`/usr/bin/python3 license_validation.py $1 $2 $3 MOLECULE 60`

status=`echo $result|cut -d, -f1|awk -F':' '{ print $2 }'`
token=`echo $result|cut -d, -f2|awk -F':' '{ print $2 }'`

echo $token
