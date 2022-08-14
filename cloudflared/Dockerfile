# ARG BUILD_FROM
# FROM ${BUILD_FROM}
FROM alpine:3.16

ARG BUILD_ARCH
ARG BUILD_VERSION

COPY rootfs /

RUN if [ "${BUILD_ARCH}" = "aarch64" ]; then ARCH="arm64"; fi && \
    if [ "${BUILD_ARCH}" = "armhf" ]; then ARCH="armhf"; fi && \
    if [ "${BUILD_ARCH}" = "armv7" ]; then ARCH="arm"; fi && \
    if [ "${BUILD_ARCH}" = "amd64" ]; then ARCH="amd64"; fi && \
    if [ "${BUILD_ARCH}" = "i386" ]; then ARCH="386"; fi && \
    apk add --no-cache curl && \
    curl -L -o /usr/local/bin/cloudflared \
        "https://github.com/cloudflare/cloudflared/releases/download/${BUILD_VERSION}/cloudflared-linux-${ARCH}" && \
    chmod 755 /usr/local/bin/cloudflared /usr/local/bin/cloudflared_launch.sh

CMD /usr/local/bin/cloudflared_launch.sh
