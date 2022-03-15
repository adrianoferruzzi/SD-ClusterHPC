#!/usr/bin/expect -f
set timeout -1
spawn apt-get -y install nis
expect "*domainname*"
send -- "\r"
expect "*domain*"
send -- "\r"
expect eof