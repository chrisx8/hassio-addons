# Home Assistant Add-on: Apache with mod-auth-openidc

Apache web server and reverse proxy with support for OpenID Connect authentication,
powered by [mod-auth-openidc](https://github.com/OpenIDC/mod_auth_openidc).

## Configuration

### SSL certificate

The certificate for your domain needs to created and saved in `/ssl`. You can do
so manually, or via the DuckDNS add-on or the Let's Encrypt add-on.

### Home Assistant config

You should configure Home Assistant to only listen on the Supervisor network and
allow this add-on to act as a reverse proxy. To do this, add the following to
`configuration.yaml`:
```yaml
http:
  server_host: 172.30.32.1
  use_x_forwarded_for: true
  trusted_proxies:
    - 172.30.33.0/24
```

Since we're using Home Assistant behind a reverse proxy, some options in
`configuration.yaml` is no longer needed and should be removed. These options
include:
- ssl_certificate
- ssl_key
- server_port

### Add-on configuration

In the add-on configuration, all required options should be configured appropriately.
See the add-on configuration page for more information.

Notes:
- HSTS header can be empty. Doing so disables HSTS.
- Get OpenID Connect metadata/discovery URL, Client ID, and Client Secret from
  your identity provider.
- The Redirect URI must start with the proper scheme and the domain specified earlier,
  and end with `/auth/openid-connect`. Example: `https://example.com/auth/openid-connect`

### Home Assistant authentication

Home Assistant's built-in authentication is still active (users still need to log
in to Home Assistant after OIDC login) Since we're adding OIDC with this add-on,
this may not be the desirable. Consider using an alternative authentication
provider, such as
[Trusted Networks](https://www.home-assistant.io/docs/authentication/providers/#trusted-networks)
or [Header Auth](https://github.com/BeryJu/hass-auth-header).

## ⚠️ WARNING

**Use caution when changing Home Assistant authentication options!**

If misconfigured, your Home Assistant instance may be accessible by everyone.
Make sure Home Assistant is **only accessible via the reverse proxy**!
