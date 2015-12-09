mosjwt.sh -- a tool to get signed JWT (JSON Web Token) as required to access
addons.mozilla.org (AMO) API.

Dependencies
============

The script should work on any POSIX system with openssl binary installed
somewhere in $PATH.

Usage
=====

Set ISS and SECRET variables inside the script. Then use is as in the
following example:

    $ curl -H "Authorization: JWT `./mozjwt.sh`" \
           https://addons.mozilla.org/api/v3/accounts/profile/

Generated token can be used only once and expires in 60 seconds.

See also
========

- [RFC 7515 "JSON Web Signature (JWS)"][rfc7515]
- [RFC 7519 "JSON Web Token (JWT)"][rfc7519]
- [Mozilla Olympia External API documentation][amoauth]


[rfc7515]: https://tools.ietf.org/html/rfc7515
[rfc7519]: https://tools.ietf.org/html/rfc7519
[amoauth]: https://olympia.readthedocs.org/en/latest/topics/api/auth.html
