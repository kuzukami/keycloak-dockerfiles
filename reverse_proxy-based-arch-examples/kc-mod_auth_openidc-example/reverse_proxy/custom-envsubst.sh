envsubst '${OIDCResponseType}' | \
envsubst '${OIDCCryptoPassphrase}' | \
envsubst '${OIDCCookieDomain}' | \
envsubst '${OIDCSSLValidateServer}' | \
envsubst '${OIDCProviderMetadataURL}' | \
envsubst '${OIDCPassIDTokenAs}' | \
envsubst '${OIDCPassClaimsAs}' | \
envsubst '${LimitRequestFieldSize}' | \
envsubst '${LogFormat}' | \
envsubst '${CustomLog}' | \
envsubst '${DumpIOInput}' | \
envsubst '${DumpIOOutput}' | \
envsubst '${LogLevel}' | \
envsubst '${CookieTracking}' | \
envsubst '${CookieExpires}' | \
envsubst '${CookieName}' | \
envsubst '${ServerName}' | \
envsubst '${ProxyAddHeaders}' | \
envsubst '${RequestHeader}' | \
envsubst '${ProxyPass}' | \
envsubst '${OIDCRedirectURI}' | \
envsubst '${OIDCClientID}' | \
envsubst '${OIDCClientSecret}' | \
envsubst '${OIDCSessionInactivityTimeout}' | \
envsubst '${OIDCSessionMaxDuration}' | \
envsubst '${OIDCSessionType}' | \
envsubst '${OIDCSessionCookieChunkSize}' | \
envsubst '${OIDCPassRefreshToken}' | \
envsubst '${OIDCCookie}' | \
envsubst '${ServerNameForUnknownHostAccess}' | \
cat 
