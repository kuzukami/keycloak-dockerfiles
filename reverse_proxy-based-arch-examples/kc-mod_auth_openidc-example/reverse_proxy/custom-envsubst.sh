sed "s|OIDCResponseType.code|${OIDCResponseType}|g" | \
sed "s|OIDCCryptoPassphrase.password|${OIDCCryptoPassphrase}|g" | \
sed "s|OIDCCookieDomain.example.com|${OIDCCookieDomain}|g" | \
sed "s|OIDCSSLValidateServer.Off|${OIDCSSLValidateServer}|g" | \
sed "s|https://sso.example.com/auth/realms/demo/.well-known/openid-configuration|${OIDCProviderMetadataURL}|g" | \
sed "s|OIDCPassClaimsAs.headers|${OIDCPassClaimsAs}|g" | \
sed "s|64000|${LimitRequestFieldSize}|g" | \
sed "s|ServerName.app1.example.com|${ServerName}|g" | \
sed "s|/ http://host.docker.internal:8081/|${ProxyPass}|g" | \
sed "s|https://app1.example.com/oidc-redirect/|${OIDCRedirectURI}|g" | \
sed "s|OIDCClientID.demo-app1|${OIDCClientID}|g" | \
sed "s|OIDCClientSecret.secret|${OIDCClientSecret}|g" | \
sed "s|31536000|${OIDCSessionInactivityTimeout}|g" | \
sed "s|15432|${OIDCSessionMaxDuration}|g" | \
sed "s|client-cookie:persistent|${OIDCSessionType}|g" | \
sed "s|3900|${OIDCSessionCookieChunkSize}|g" | \
sed "s|mod_auth_openidc_session|${OIDCCookie}|g" | \
sed "s|#Debug_Trace#|${httpd_debugdump}|g" | \
sed "s|dummy.example.com|${ServerNameForUnknownHostAccess}|g" | \
cat 
