# desired Caddy version
ARG VERSION=2.4.6

###########
# builder #
FROM caddy:${VERSION}-builder-alpine AS builder
ARG VERSION
RUN xcaddy build v${VERSION} \
    --with github.com/caddy-dns/cloudflare

#########
# image #
FROM caddy:${VERSION}-alpine
COPY --from=builder /usr/bin/caddy /usr/bin/caddy