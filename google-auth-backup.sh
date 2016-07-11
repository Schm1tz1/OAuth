#!/bin/bash
adb pull /data/data/com.google.android.apps.authenticator2/databases/databases google-auth-databases.sqlite 
sqlite3 google-auth-databases.sqlite .dump >google-auth-databases.sql
