FROM quay.io/curl/curl:latest as build

ARG TARGETOS="linux"
ARG TARGETARCH="amd64"
ARG DRIVE_VERSION="v0.4.0"

ARG PUID=1000
ARG PGID=1000

RUN \
    curl --location --output /tmp/drive "https://github.com/odeke-em/drive/releases/download/${DRIVE_VERSION}/drive_${TARGETOS}" && \
    chmod +x /tmp/drive

FROM debian:bookworm as release

ARG PUID=1000
ARG PGID=1000

COPY --from=build /tmp/drive /usr/local/bin/drive

RUN \
    apt-get update && \
    apt-get install --quiet --yes ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/lib/gdrive

RUN \
  addgroup \
    --gid "${PGID}" gdrive && \
  adduser \
    --gid "${PGID}" \
    --uid "${PUID}" \
    --gecos "" \
    --disabled-password \
    --shell /bin/sh \
    --home /var/lib/gdrive \
    gdrive

VOLUME /var/lib/gdrive

WORKDIR /var/lib/gdrive

USER gdrive

ENTRYPOINT ["drive"]
