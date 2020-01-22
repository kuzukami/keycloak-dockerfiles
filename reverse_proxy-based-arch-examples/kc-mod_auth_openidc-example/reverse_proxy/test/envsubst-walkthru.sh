#!/bin/sh

set -eu


(
set -o allexport
source ../sample.env

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
echo 10;fgrep "${OIDCSessionType}" .genresult.disposable
echo 11;fgrep "${OIDCSessionInactivityTimeout}" .genresult.disposable
echo 12;fgrep "${OIDCSessionMaxDuration}" .genresult.disposable
echo 13;fgrep "${Debug_Trace_Comment}" .genresult.disposable
echo '13/13 success'

rm -f .genresult.disposable

)
