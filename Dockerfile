FROM alpine:latest as build
RUN apk add --no-cache gnupg

ARG TINI_VERSION=v0.19.0
ARG TINI_KEY=595E85A6B1B4779EA4DAAEC70B588DFF0527A9B7
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini-static /tini-static
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini-static.asc /tini-static.asc
RUN gpg --batch --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys ${TINI_KEY} \
    && gpg --batch --verify /tini-static.asc /tini-static
RUN chmod +x /tini-static

FROM busybox:latest
COPY --from=build tini-static /sbin/tini

WORKDIR /

ENTRYPOINT ["/sbin/tini", "--"]
