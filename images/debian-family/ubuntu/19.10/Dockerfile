FROM ubuntu:19.10

LABEL summary="Molecule Systemd Ubuntu" \
      name="mpaivabarbosa/molecule-systemd-ubuntu" \
      maintainer="Marcio Barbosa <mpaivabarbosa@gmail.com>"

RUN sed -i 's|archive.ubuntu.com|old-releases.ubuntu.com|g' /etc/apt/sources.list && \
    sed -i 's|security.ubuntu.com|old-releases.ubuntu.com|g' /etc/apt/sources.list && \
    sed -i 's/# deb/deb/g' /etc/apt/sources.list && \
    apt-get update -y && \
    apt-get install -y --no-install-recommends apt-utils systemd systemd-cron python3 python3-pip sudo bash vim ca-certificates iproute2 && \
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

# Custom bashrc
RUN printf "# .bashrc \n\n\
alias pip=pip3 \n\
alias python=python3 \n\
alias ll='ls -l --color=auto' \n\
alias rm='rm -i' \n\
alias cp='cp -i' \n\
alias mv='mv -i' \n\n\
if [ -f /etc/bashrc ]; then \n\
	. /etc/bashrc \n\
fi \n\
" > /root/.bashrc

VOLUME [ "/sys/fs/cgroup", "/tmp", "/run" ]

CMD [ "/lib/systemd/systemd" ]