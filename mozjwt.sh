#!/bin/sh -e
# External dependencies: openssl.

# obtain this values at https://addons.mozilla.org/en-US/developers/addon/api/key/
ISS=user:12345678:123
SECRET=aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa

base64url() {
    openssl base64 | tr -d '=\n' | tr /+ _-
}

JTI=`openssl rand 32 2>/dev/null | base64url`
IAT=`date +%s`
EXP=`expr $IAT + 60`

JOSE=`echo -n '{"alg":"HS256","typ":"JWT"}' | base64url`
CLAIMS=`echo -n "{\"iss\":\"$ISS\",\"jti\":\"$JTI\",\"iat\":$IAT,\"exp\":$EXP}" | base64url`
DGST=`echo -n "$JOSE.$CLAIMS" | openssl dgst -sha256 -hmac $SECRET -binary | base64url`

JWT="$JOSE.$CLAIMS.$DGST"
echo "$JWT"
