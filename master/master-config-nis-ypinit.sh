#!/usr/bin/expect -f
set timeout -1
spawn sudo /usr/lib/yp/ypinit -m
expect "next host to add:"
send -- "\x04"
expect "*Is this correct?*"
send -- "\r"
expect eof