#!/usr/bin/env bash

function server () {
  while true
  do
    message_arr=()
    check=true
    while $check
    do
      read line
      message_arr+=($line)
      if [[ "${#line}" -eq 1 ]]
      then
        check=false
      fi
    done
    method=${message_arr[0]}
    path=${message_arr[1]}
    if [[ $method = 'GET' ]]
    then
      if [[ -f "./www/$path" ]]
      then
        content_length=`wc -c < ./www$path`
        content_length=$(wc -c < ./www$path)
        echo -ne 'HTTP/1.1 200 OK\r\n'; echo -ne 'Content-Type: text/html; charset=utf-8\r\n'; echo -ne "Content-Length: $content_length\r\n"; cat "./www/$path"
      else
        echo -ne 'HTTP/1.1 404 Not Found\r\n\'; echo -ne 'Content-Length: 0\r\n'
      fi
    else
      echo -ne 'HTTP/1.1 400 Bad Request\r\n\r\n'; echo -ne 'Content-Length: 0\r\n'
    fi
  done
}

coproc SERVER_PROCESS { server; }

nc -klv 2345 <&${SERVER_PROCESS[0]} >&${SERVER_PROCESS[1]}