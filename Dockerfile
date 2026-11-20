FROM debian:13.7
LABEL maintainer="Coding <code@ongoing.today>"

ENV DEBIAN_FRONTEND=noninteractive

# hadolint ignore=DL3008
RUN apt-get update && \
    apt-get upgrade -yq && \
    apt-get -y install --no-install-recommends \
        curl \
        gnupg2 \
        zstd && \
    curl -fsSL http://download.proxmox.com/debian/proxmox-release-bookworm.gpg -o /usr/share/keyrings/proxmox-release-bookworm.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/proxmox-release-bookworm.gpg] http://download.proxmox.com/debian bookworm pve-no-subscription" > /etc/apt/sources.list.d/proxmox.list && \
    apt-get update && \
    apt-get -y install --no-install-recommends \
        pve-qemu-kvm && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /usr/share/doc && \
    rm -rf /usr/local/share/man /var/cache/debconf/*-old

CMD ["/bin/bash", "-l"]
