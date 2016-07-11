#!/bin/bash
#
# Format: otpauth://TYPE/LABEL?PARAMETERS
# (example: otpauth://totp/Example:alice@google.com?secret=JBSWY3DPEHPK3PXP&issuer=Example)
#
sqlite3 google-auth-databases.sqlite 'SELECT type, email TEXT, secret, issuer FROM accounts' >/tmp/auth.txt;

while IFS='|' read typ lab sec iss;do
    #echo $typ $lab $sec $iss
	ln=$(echo $lab | sed -e 's/@/_/g' | sed -e 's/\//_/g')
	qrencode -o $ln.png otpauth://totp/$lab?secret=$sec&issuer=$iss
done < /tmp/auth.txt
rm /tmp/auth.txt

