ARG BUILD_FROM
FROM ${BUILD_FROM}

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Build arguments
ARG BUILD_ARCH
ARG TAILSCALE_VERSION=1.24.2

# Setup base
RUN apk add --no-cache ip6tables ipcalc iproute2 iptables \
    && ln -sf /sbin/xtables-nft-multi /sbin/ip6tables \
    && ln -sf /sbin/xtables-nft-multi /sbin/iptables \
    && if [ "${BUILD_ARCH}" = "aarch64" ]; then ARCH="arm64"; fi \
    && if [ "${BUILD_ARCH}" = "armhf" ]; then ARCH="arm"; fi \
    && if [ "${BUILD_ARCH}" = "armv7" ]; then ARCH="arm"; fi \
    && if [ "${BUILD_ARCH}" = "amd64" ]; then ARCH="amd64"; fi \
    && if [ "${BUILD_ARCH}" = "i386" ]; then ARCH="386"; fi \
    && echo "https://pkgs.tailscale.com/stable/tailscale_${TAILSCALE_VERSION}_${ARCH}.tgz" \
    && curl -L -s \
        "https://pkgs.tailscale.com/stable/tailscale_${TAILSCALE_VERSION}_${ARCH}.tgz" \
        | tar zxvf - -C /opt/ --strip-components 1 \
    && rm -rf /opt/systemd

# Copy config
COPY etc /etc
