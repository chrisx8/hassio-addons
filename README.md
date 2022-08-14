# Chris's Home Assistant Add-ons

[![builder](https://github.com/chrisx8/home-assistant-addons/actions/workflows/build.yaml/badge.svg)](https://github.com/chrisx8/home-assistant-addons/actions/workflows/build.yaml)

This repository contains Home Assistant add-ons maintained by [chrisx8](https://github.com/chrisx8).

## Add this repository to Home Assistant

To add this add-on repository to your Home Assistant instance, click the My Home Assistant button below.

[![Add this add-on repository to your Home Assistant instance](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Fchrisx8%2Fhome-assistant-addons.git)

Alternatively, you may add this repository manually and install add-ons via the *Add-on Store*.
Use this repository URL:
```
https://github.com/chrisx8/home-assistant-addons.git
```

## Add-ons in this repository

### [Apache with OpenID Connect](apache-oidc/)

[![Show the "Apache with OpenID Connect" add-on in your Home Assistant instance](https://my.home-assistant.io/badges/supervisor_addon.svg)](https://my.home-assistant.io/redirect/supervisor_addon/?addon=2d22a816_apache-oidc)

Apache web server and reverse proxy with support for OpenID Connect authentication,
powered by [`mod-auth-openidc`](https://github.com/zmartzone/mod_auth_openidc).

### [cloudflared](cloudflared/)

[![Show the cloudflared add-on in your Home Assistant instance](https://my.home-assistant.io/badges/supervisor_addon.svg)](https://my.home-assistant.io/redirect/supervisor_addon/?addon=2d22a816_tailscale)

[cloudflared](https://github.com/cloudflare/cloudflared) is the Cloudflare Tunnel client. This contains the command-line client for Cloudflare Tunnel and a tunneling daemon that proxies traffic from the Cloudflare network to your origins. The daemon sits between Cloudflare network and your origin (e.g. a webserver).

### [Tailscale](tailscale/)

[![Show the Tailscale add-on in your Home Assistant instance](https://my.home-assistant.io/badges/supervisor_addon.svg)](https://my.home-assistant.io/redirect/supervisor_addon/?addon=2d22a816_tailscale)

[Tailscale](https://tailscale.com) is a zero config VPN, which installs on any device in minutes,
including your Home Assistant instance.

Create a secure network between your servers, computers, and cloud instances.
Even when separated by firewalls or subnets, Tailscale just works. Tailscale
manages firewall rules for you, and works from anywhere you are.
