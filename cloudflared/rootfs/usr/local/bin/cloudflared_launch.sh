#!/usr/bin/with-contenv bashio

# Load config
edge_ip_version=$(bashio::config 'edge_ip_version')
token=$(bashio::config 'token')

echo "Launching cloudflared..."
exec /usr/local/bin/cloudflared tunnel \
  --edge-ip-version "$edge_ip_version" \
  --no-autoupdate \
  run \
  --token "$token"
