#!/bin/bash

echo $1
echo $2

token=$(get_token -u "$1":"$2" -m 2>/dev/null | tail -n 1)
echo "::set-output name=token::$token"
