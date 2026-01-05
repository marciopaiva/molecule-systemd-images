FROM opensuse/leap:15.6

LABEL summary="Molecule Systemd openSUSE Leap 15.6" \
      name="mpaivabarbosa/molecule-systemd-opensuse" \
      maintainer="Marcio Barbosa <mpaivabarbosa@gmail.com>"

RUN zypper --non-interactive refresh && \
    zypper --non-interactive update && \
    zypper --non-interactive install -y systemd python3 python3-pip sudo bash vim iproute2 procps && \
    rm -rf /usr/share/doc/* && \
    rm -rf /usr/share/man/* && \
    zypper clean --all

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
ENV ANSIBLE_USER=ansible
RUN set -xe && \
    groupadd -r ${ANSIBLE_USER} && \
    useradd -m -g ${ANSIBLE_USER} ${ANSIBLE_USER} && \
    echo "${ANSIBLE_USER} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/${ANSIBLE_USER} && \
    chmod 0440 /etc/sudoers.d/${ANSIBLE_USER}

VOLUME [ "/sys/fs/cgroup", "/tmp", "/run" ]

CMD [ "/usr/lib/systemd/systemd" ]
