# Home Assistant Add-on: cloudflared

[![Show the cloudflared add-on in your Home Assistant instance](https://my.home-assistant.io/badges/supervisor_addon.svg)](https://my.home-assistant.io/redirect/supervisor_addon/?addon=e4a3adf5_cloudflared)

[cloudflared](https://github.com/cloudflare/cloudflared) is the Cloudflare Tunnel client. This contains the command-line client for Cloudflare Tunnel and a tunneling daemon that proxies traffic from the Cloudflare network to your origins. The daemon sits between Cloudflare network and your origin (e.g. a webserver).

## Prerequisites

You need to have a Cloudflare account with an active Cloudflare Zero Trust (free tier is sufficient).

## Configuration

You should configure your Cloudflare Tunnel with the Cloudflare Zero Trust dashboard.

When you create a tunnel, the dashboard will give you a token. This token needs to be placed in this add-on's config.

```yaml
token: super_secret_token
```

### Option: `token`

`cloudflared` token. Get this from the Cloudflare Zero Trust dashboard.
