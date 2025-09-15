FROM ubuntu:24.04

LABEL summary="Molecule Systemd Ubuntu 24.04" \
      name="mpaivabarbosa/molecule-systemd-ubuntu" \
      maintainer="Marcio Barbosa <mpaivabarbosa@gmail.com>"

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends systemd systemd-cron python3 python3-pip sudo bash vim ca-certificates iproute2 && \
    rm -Rf /usr/share/doc && \
    rm -Rf /usr/share/man && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN rm -f /lib/systemd/system/multi-user.target.wants/* \
    /etc/systemd/system/*.wants/* \
    /lib/systemd/system/local-fs.target.wants/* \
    /lib/systemd/system/sockets.target.wants/*udev* \
    /lib/systemd/system/sockets.target.wants/*initctl* \
    /lib/systemd/system/sysinit.target.wants/systemd-tmpfiles-setup* \
    /lib/systemd/system/systemd-update-utmp*

# Disable requiretty.
RUN sed -i -e 's/^\(Defaults\s*requiretty\)/#--- \1/'  /etc/sudoers

# Create `ansible` user with sudo permissions
ENV ANSIBLE_USER=ansible SUDO_GROUP=sudo
RUN set -xe && \
    groupadd -r ${ANSIBLE_USER} && \
    useradd -m -g ${ANSIBLE_USER} ${ANSIBLE_USER} && \
    usermod -aG ${SUDO_GROUP} ${ANSIBLE_USER} && \
    sed -i "/^%${SUDO_GROUP}/s/ALL\$/NOPASSWD:ALL/g" /etc/sudoers

VOLUME [ "/sys/fs/cgroup", "/tmp", "/run" ]

CMD [ "/lib/systemd/systemd" ]