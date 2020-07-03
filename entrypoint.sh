#!/bin/bash

token=$(get_token -u "$APIGEE_USER":"$APIGEE_PASSWORD" -m 2>/dev/null | tail -n 1)
echo "::set-output name=token::$token"
