#!/usr/bin/expect

set timeout 60

spawn sshpass -p default ssh admin@[lindex $argv 0]
expect "*#*"
send "zzdebugshell\r"
expect "\r\n\r"
send "default\r"
expect "\r\n"
send "ernst\r"
expect -re "#.*|\\$.*"
interact
