FROM debian:buster
LABEL maintainer="Coding <code@ongoing.today>"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get upgrade -yq && \
    apt-get -y install --no-install-recommends \
        curl \
        gnupg2 && \
    echo "deb http://download.proxmox.com/debian buster pve-no-subscription" > /etc/apt/sources.list.d/proxmox.list && \
    curl -s http://download.proxmox.com/debian/proxmox-ve-release-6.x.gpg > /etc/apt/trusted.gpg.d/proxmox-ve-release-6.x.gpg && \
    apt-get update && \
    apt-get -y install --no-install-recommends \
        pve-qemu-kvm && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /usr/share/doc && \
    rm -rf /usr/local/share/man /var/cache/debconf/*-old

CMD /bin/bash -l
