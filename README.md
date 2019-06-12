# tini-static

A Tiny Tini dockerfile for use as a busybox base or for copying into other containers using `COPY --from`

## Installation

In your Dockerfile:

```docker
COPY --from=ibotta/tini-static:latest sbin/tini sbin/tini
```

## Usage

In your Dockerfile:

```docker
ENTRYPOINT ["/sbin/tini", "--"]
```

## Development

* Travis downloads and verifies the binary
* Docker builds the image
* Travis and docker push the image

Updates require updating the version number. The key should stay the same.
