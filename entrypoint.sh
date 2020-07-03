#!/bin/bash

token=$(get_token -u "$APIGEE_USER":"$APIGEE_PASSWORD" -m "$APIGEE_MFA" 2>/dev/null | tail -n 1)

echo "::set-output name=token::add-mask::$token"
