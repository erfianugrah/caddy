ARG VERSION=2.4.6

FROM caddy:${VERSION}-builder-alpine AS builder
ARG VERSION
RUN xcaddy build v${VERSION} \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/lucaslorentz/caddy-docker-proxy/plugin
FROM caddy:${VERSION}-alpine
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD ["caddy", "docker-proxy"]