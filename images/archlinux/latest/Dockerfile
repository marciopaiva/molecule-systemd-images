FROM archlinux:latest

LABEL summary="Molecule Systemd Arch Linux (Rolling Release)" \
      name="mpaivabarbosa/molecule-systemd-archlinux" \
      maintainer="Marcio Barbosa <mpaivabarbosa@gmail.com>"

RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm systemd python python-pip sudo bash vim iproute2 procps-ng && \
    rm -rf /usr/share/doc/* && \
    rm -rf /usr/share/man/* && \
    pacman -Scc --noconfirm

RUN cd /usr/lib/systemd/system/sysinit.target.wants/; \
    for i in *; do [ $i = systemd-tmpfiles-setup.service ] || rm -f $i; done

RUN rm -f /usr/lib/systemd/system/multi-user.target.wants/* \
    /etc/systemd/system/*.wants/* \
    /usr/lib/systemd/system/local-fs.target.wants/* \
    /usr/lib/systemd/system/sockets.target.wants/*udev* \
    /usr/lib/systemd/system/sockets.target.wants/*initctl* \
    /usr/lib/systemd/system/basic.target.wants/* \
    /usr/lib/systemd/system/anaconda.target.wants/*

# Disable requiretty.
RUN sed -i -e 's/^\(Defaults\s*requiretty\)/#--- \1/'  /etc/sudoers || echo "Defaults !requiretty" > /etc/sudoers.d/molecule

# Create `ansible` user with sudo permissions
ENV ANSIBLE_USER=ansible SUDO_GROUP=wheel
RUN set -xe && \
    groupadd -r ${ANSIBLE_USER} && \
    useradd -m -g ${ANSIBLE_USER} ${ANSIBLE_USER} && \
    usermod -aG ${SUDO_GROUP} ${ANSIBLE_USER} && \
    sed -i "/^# %${SUDO_GROUP}/s/^# //g" /etc/sudoers && \
    sed -i "/^%${SUDO_GROUP}/s/ALL$/NOPASSWD:ALL/g" /etc/sudoers

VOLUME [ "/sys/fs/cgroup", "/tmp", "/run" ]

CMD [ "/usr/lib/systemd/systemd" ]
