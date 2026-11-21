FROM debian:13.7@sha256:9c6e381421d0f48d1b8133e573f33c185ee16cbf505eda9c4a8a4791b25ea8a6
LABEL maintainer="Coding <code@ongoing.today>"

ENV DEBIAN_FRONTEND=noninteractive

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# hadolint ignore=DL3008
RUN apt-get update && \
    apt-get upgrade -yq && \
    apt-get -y install --no-install-recommends \
        ca-certificates \
        curl \
        zstd && \
    curl -fsSL https://enterprise.proxmox.com/debian/proxmox-archive-keyring-trixie.gpg -o /usr/share/keyrings/proxmox-archive-keyring.gpg && \
    echo "136673be77aba35dcce385b28737689ad64fd785a797e57897589aed08db6e45  /usr/share/keyrings/proxmox-archive-keyring.gpg" | sha256sum -c - && \
    printf 'Types: deb\nURIs: http://download.proxmox.com/debian/pve\nSuites: trixie\nComponents: pve-no-subscription\nSigned-By: /usr/share/keyrings/proxmox-archive-keyring.gpg\n' > /etc/apt/sources.list.d/proxmox.sources && \
    apt-get update && \
    apt-get -y install --no-install-recommends \
        pve-qemu-kvm && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /usr/share/doc && \
    rm -rf /usr/local/share/man /var/cache/debconf/*-old

CMD ["/bin/bash", "-l"]
