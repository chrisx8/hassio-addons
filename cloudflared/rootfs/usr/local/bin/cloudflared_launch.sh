#!/usr/bin/with-contenv bashio

# Load config
token=$(bashio::config 'token')

echo "Launching cloudflared..."
exec /usr/local/bin/cloudflared tunnel --no-autoupdate run --token "$token"
