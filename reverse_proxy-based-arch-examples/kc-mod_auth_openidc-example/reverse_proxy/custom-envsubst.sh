sed "s/OIDCCryptoPassphrase.password/${OIDCCookiePasswd}/" | \
sed "s/OIDCCookieDomain.example.com/${OIDCCookieDomain}/" | \
sed "s|https://sso.example.com/auth/realms/demo/.well-known/openid-configuration|${OIDCMetadataURL}|" | \
sed "s|dummy.example.com|${OIDCUnmatchedDefaultServerName}|" | \
sed "s|ServerName.app1.example.com|${OIDCRevProxyFrontServerName}|" | \
sed "s|http://host.docker.internal:8081/|${OIDCRevProxyBackendServerURL}|" | \
sed "s|https://app1.example.com/oidc-redirect/|${OIDRevProxyTokenReceiveURL}|" | \
sed "s|OIDCClientID.demo-app1|${OIDCClientID}|" | \
sed "s|OIDCClientSecret.secret|${OIDCClientSecret}|"