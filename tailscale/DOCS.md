# Home Assistant Add-on: Tailscale

Tailscale is a zero config VPN, which installs on any device in minutes,
including your Home Assistant instance.

## Prerequisites

In order to use this add-on, you'll need a Tailscale account.

It is free to use for personal & hobby projects, up to 20 clients/devices on a
single user account. Sign up using your Google, Microsoft or GitHub account at
the following URL:

<https://login.tailscale.com/start>

You can also create an account during the add-on installation processes,
however, it is nice to know where you need to go later on.

## Configuration

When logging in to Tailscale, you can configure your Tailscale network right
from their interface.

<https://login.tailscale.com/>

The add-on can expose "Subnet Router" and "Exit Node" capabilities that you can
configure from add-on configuration and your Tailscale account.

```yaml
accept_dns: false
advertise_exit_node: true
advertise_routes:
  - 192.168.1.0/24
```

### Option: `accept_dns`

Use Tailscale DNS on Home Assistant host.

### Option: `advertise_exit_node`

Advertise the "Exit Node" capability. It still needs to be enabled in your
Tailscale account.

Tailscale docs: <https://tailscale.com/kb/1103/exit-nodes/>

### Option: `advertise_routes`

Specify routes to enable the "Subnet Router" capability. Routes should be
specified in CIDR notation (`address/mask`, like `192.168.0.0/24`).

Additionally, you need to enable specific subnet routes in your Tailscale account.

Tailscale docs: <https://tailscale.com/kb/1019/subnets/>
