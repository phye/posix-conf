#!/usr/bin/expect
set timeout 60
spawn sshpass -p [lindex $argv 1] ssh [lindex $argv 0]@[lindex $argv 2]
interact
