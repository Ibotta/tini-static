FROM busybox:latest

# get the binary
ARG TINI_VERSION=v0.18.0
ARG TINI_KEY=595E85A6B1B4779EA4DAAEC70B588DFF0527A9B7
COPY tini-static /sbin/tini

WORKDIR /

ENTRYPOINT ["/sbin/tini", "--"]
