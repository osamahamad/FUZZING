#!/bin/bash

config_filename="config.txt"
filetoscan="activedomains.out";
responses_meg_path="blh";

meg -c 300 --location / $filetoscan $responses_meg_path

cd $responses_meg_path ; find . -type f -exec cat {} + | xurls >> ../scraped-homepages-urls.out
cd ../;
mkdir broken-link-pages ; 

for conf in $(cat $config_filename )
do
cat scraped-homepages-urls.out | grep "$(echo "$i" | cut -d "," -f1)" > broken-link-pages/$(echo "$i" | cut -d "," -f2)
done
