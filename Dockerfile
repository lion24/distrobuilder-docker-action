FROM ubuntu:20.04 as base

ENV DEBIAN_FRONTEND=noninteractive
ENV GOBIN="/usr/local/bin"

# hadolint ignore=DL3008
RUN apt-get update && apt-get -y install --no-install-recommends build-essential \
        golang-go debootstrap rsync gpg squashfs-tools git ca-certificates && \
        apt-get clean all && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh

RUN go get -d -v github.com/lxc/distrobuilder/distrobuilder

RUN bash -c "pushd $HOME/go/src/github.com/lxc/distrobuilder && \
        make && \
        popd"

WORKDIR /data

ENTRYPOINT ["/entrypoint.sh"]
CMD ["--help"]
