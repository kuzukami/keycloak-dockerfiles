# sed "s/OIDCCryptoPassphrase.password/${OIDCCookiePasswd}/" \
# sed "s/OIDCCookieDomain.example.com/${OIDCCookieDomain}/" \
# sed "s|https://sso.example.com/auth/realms/demo/.well-known/openid-configuration|${OIDCMetadataURL}|" \
# sed "s|dummy.example.com|${OIDCUnmatchedDefaultServerName}|" \
# sed "s|ServerName.app1.example.com|${OIDCRevProxyFrontServerName}|" \
# sed "s|http://host.docker.internal:8081/|${OIDRevProxyBackendServerURL}|" \
# sed "s|https://app1.example.com/oidc-redirect/|${OIDRevProxyTokenReceiveURL}|" \
# sed "s|OIDCClientID.demo-app1|${OIDClientID}|" \
# sed "s|OIDCClientSecret.secret|${OIDClientSecret}|"

export OIDCCookiePasswd=cpasswd
export OIDCCookieDomain=dom
export OIDCMetadataURL=meda
export OIDCUnmatchedDefaultServerName=defhoge.com
export OIDCRevProxyFrontServerName=fronturi.hogehooge.com
export OIDRevProxyBackendServerURL=http://backeng1.local:80/
export OIDRevProxyTokenReceiveURL=https://fronturi.hogehoge.com/token-receipt
export OIDClientID=revpro-exampleclient
export OIDClientSecret=12345

cat ../proxy.conf | \
bash ../custom-envsubst.sh 