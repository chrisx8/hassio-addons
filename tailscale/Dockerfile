ARG BUILD_FROM
FROM ${BUILD_FROM}

ARG BUILD_ARCH
ARG BUILD_VERSION

RUN apk add --no-cache ip6tables ipcalc iproute2 iptables \
    && ln -sf /sbin/xtables-nft-multi /sbin/ip6tables \
    && ln -sf /sbin/xtables-nft-multi /sbin/iptables \
    && if [ "${BUILD_ARCH}" = "aarch64" ]; then ARCH="arm64"; fi \
    && if [ "${BUILD_ARCH}" = "amd64" ]; then ARCH="amd64"; fi \
    && curl -L -s \
        "https://pkgs.tailscale.com/stable/tailscale_${BUILD_VERSION}_${ARCH}.tgz" \
        | tar zxvf - -C /opt/ --strip-components 1 \
    && rm -rf /opt/systemd

COPY rootfs /
