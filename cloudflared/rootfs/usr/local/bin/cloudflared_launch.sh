#!/usr/bin/with-contenv bashio

# Load config
token=$(bashio::config 'token')

echo "Launching cloudflared..."
/usr/local/bin/cloudflared tunnel run --token "$token"
