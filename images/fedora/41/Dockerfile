FROM fedora:41

LABEL summary="Molecule Systemd Fedora 41" \
      name="mpaivabarbosa/molecule-systemd-fedora" \
      maintainer="Marcio Barbosa <mpaivabarbosa@gmail.com>"

RUN dnf makecache && \
    dnf update -y && \
    dnf install -y systemd python3 python3-pip sudo bash vim iproute procps-ng util-linux-user && \
    rm -Rf /usr/share/doc && \
    rm -Rf /usr/share/man && \
    dnf clean all

RUN cd /lib/systemd/system/sysinit.target.wants/; \
    for i in *; do [ $i = systemd-tmpfiles-setup.service ] || rm -f $i; done

RUN rm -f /lib/systemd/system/multi-user.target.wants/* \
    /etc/systemd/system/*.wants/* \
    /lib/systemd/system/local-fs.target.wants/* \
    /lib/systemd/system/sockets.target.wants/*udev* \
    /lib/systemd/system/sockets.target.wants/*initctl* \
    /lib/systemd/system/basic.target.wants/* \
    /lib/systemd/system/anaconda.target.wants/*

# /etc/shadow ships with mode 0000 in these base images; pam_unix's
# account phase then fails to read it and sudo refuses with "PAM account
# management error: Authentication service cannot retrieve authentication
# info". broken_shadow tells pam_unix to ignore that and rely on NSS
# instead. Confirmed via CI: sudo >= 1.9 hits this, sudo 1.8.x (CentOS 8)
# does not.
RUN sed -i -E 's/^(account\s+required\s+pam_unix\.so)$/\1 broken_shadow/' /etc/pam.d/system-auth

# Disable requiretty.
RUN sed -i -e 's/^\(Defaults\s*requiretty\)/#--- \1/'  /etc/sudoers

# Create `ansible` user with sudo permissions
ENV ANSIBLE_USER=ansible SUDO_GROUP=wheel
RUN set -xe && \
    groupadd -r ${ANSIBLE_USER} && \
    useradd -m -g ${ANSIBLE_USER} ${ANSIBLE_USER} && \
    usermod -aG ${SUDO_GROUP} ${ANSIBLE_USER} && \
    sed -i "/^%${SUDO_GROUP}/s/ALL$/NOPASSWD:ALL/g" /etc/sudoers

VOLUME [ "/sys/fs/cgroup", "/tmp", "/run" ]

CMD [ "/usr/sbin/init" ]