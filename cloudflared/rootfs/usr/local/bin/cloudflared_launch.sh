#!/usr/bin/with-contenv bashio

# Load config
token=$(bashio::config 'token')

echo "Launching cloudflared..."
exec /usr/local/bin/cloudflared tunnel run --token "$token"
