#!/bin/sh

# sed "s/OIDCCryptoPassphrase.password/${OIDCCookiePasswd}/" \
# sed "s/OIDCCookieDomain.example.com/${OIDCCookieDomain}/" \
# sed "s|https://sso.example.com/auth/realms/demo/.well-known/openid-configuration|${OIDCMetadataURL}|" \
# sed "s|dummy.example.com|${OIDCUnmatchedDefaultServerName}|" \
# sed "s|ServerName.app1.example.com|${OIDCRevProxyFrontServerName}|" \
# sed "s|http://host.docker.internal:8081/|${OIDCRevProxyBackendServerURL}|" | \
# sed "s|https://app1.example.com/oidc-redirect/|${OIDCRevProxyTokenReceiveURL}|" | \
# sed "s|OIDCClientID.demo-app1|${OIDCClientID}|" | \
# sed "s|OIDCClientSecret.secret|${OIDCClientSecret}|"

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

fgrep "${OIDCCookiePasswd}" .genresult.disposable
fgrep "${OIDCCookieDomain}" .genresult.disposable
fgrep "${OIDCMetadataURL}" .genresult.disposable
fgrep "${OIDCUnmatchedDefaultServerName}" .genresult.disposable
fgrep "${OIDCRevProxyFrontServerName}" .genresult.disposable
fgrep "${OIDCRevProxyBackendServerURL}" .genresult.disposable
fgrep "${OIDCClientID}" .genresult.disposable
fgrep "${OIDCClientSecret}" .genresult.disposable

rm -f .genresult.disposable