#!/bin/bash 

PID=`ps -f|grep "jekyll serve"|grep -v grep|awk '{print $2}'`
if [ -n $PID ]; then
	echo $PID
	kill $PID
fi
nohup jekyll serve --watch &
google-chrome "127.0.0.1:4000"
