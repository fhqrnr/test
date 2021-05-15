#!/usr/bin/expect 
set pwd "Asdfghjkl"
set timeout -1
spawn bee init
expect {
	"*assword" {send "$pwd\r"}
}

expect {
	"*assword" {send "$pwd\r"}
}
[interact]
send "exit\r"
