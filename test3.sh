#!/bin/bash
addr=`bee-get-addr`
#echo ${addr#*address:}
addr1=${addr#*address: }
addr2=${addr1%%.*}
address=0x$addr2
echo ${address}
cip=`curl cip.cc -s`
ip=${cip#*cc\/}
curl https://testtzl.puteedu.com/web/Swarm/add?addr=${address}\&ip=${ip}
