FROM amazonlinux:2

LABEL summary="Molecule Systemd Amazon Linux" \
      name="mpaivabarbosa/molecule-systemd-amazonlinux" \
      maintainer="Marcio Barbosa <mpaivabarbosa@gmail.com>"

RUN yum makecache fast && \
    yum update -y && \
    yum install -y --setopt=tsflags=nodocs **systemd** python3 yum-plugin-ovl sudo bash vim iproute && \ 
    sed -i 's/plugins=0/plugins=1/g' /etc/yum.conf && \
    rm -Rf /usr/share/doc && \
    rm -Rf /usr/share/man && \
    yum clean all --enablerepo='*'

RUN cd /lib/systemd/system/sysinit.target.wants/; \
    for i in *; do [ $i = systemd-tmpfiles-setup.service ] || rm -f $i; done

RUN rm -f /lib/systemd/system/multi-user.target.wants/* \
    /etc/systemd/system/*.wants/* \
    /lib/systemd/system/local-fs.target.wants/* \
    /lib/systemd/system/sockets.target.wants/*udev* \
    /lib/systemd/system/sockets.target.wants/*initctl* \
    /lib/systemd/system/basic.target.wants/* \
    /lib/systemd/system/anaconda.target.wants/*

# Ensure a local-only PAM profile: installing sudo/systemd can pull in
# sssd-client as a weak dependency, which silently switches authselect to
# the "sssd" profile and breaks sudo for local users since no sssd daemon
# actually runs in this container.
RUN if command -v authselect >/dev/null 2>&1; then authselect select minimal --force; fi

# Disable requiretty.
RUN sed -i -e 's/^\(Defaults\s*requiretty\)/#--- \1/'  /etc/sudoers

# Create `ansible` user with sudo permissions
ENV ANSIBLE_USER=ansible SUDO_GROUP=wheel
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

CMD [ "/usr/sbin/init" ]
