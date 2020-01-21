#!/bin/sh

set -eu

export OIDCCookiePasswd=cpasswd
export OIDCCookieDomain=dom
export OIDCMetadataURL=meda
export OIDCUnmatchedDefaultServerName=defhoge.com
export OIDCRevProxyFrontServerName=fronturi.hogehooge.com
export OIDCRevProxyBackendServerURL=http://backeng1.local:80/
export OIDRevProxyTokenReceiveURL=https://fronturi.hogehoge.com/token-receipt
export OIDCClientID=revpro-exampleclient
export OIDCClientSecret=x12345

cat ../proxy.conf | \
bash ../custom-envsubst.sh > .genresult.disposable

echo 1; fgrep "${OIDCCookiePasswd}" .genresult.disposable
echo 2;fgrep "${OIDCCookieDomain}" .genresult.disposable
echo 3;fgrep "${OIDCMetadataURL}" .genresult.disposable
echo 4;fgrep "${OIDCUnmatchedDefaultServerName}" .genresult.disposable
echo 5;fgrep "${OIDCRevProxyFrontServerName}" .genresult.disposable
echo 6;fgrep "${OIDCRevProxyBackendServerURL}" .genresult.disposable
echo 7;fgrep "${OIDRevProxyTokenReceiveURL}" .genresult.disposable
echo 8;fgrep "${OIDCClientID}" .genresult.disposable
echo 9;fgrep "${OIDCClientSecret}" .genresult.disposable
echo '9/9 success'

rm -f .genresult.disposable