FROM fedora:32

LABEL summary="Molecule Systemd Fedora" \
      name="mpaivabarbosa/molecule-systemd-fedora" \
      maintainer="Marcio Barbosa <mpaivabarbosa@gmail.com>"

ENV container docker

RUN dnf makecache --time && \
    dnf update -y && \
    dnf install -y --setopt=tsflags=nodocs systemd python3 python3-devel python*-dnf sudo bash iproute && \ 
    rm -Rf /usr/share/doc && \
    rm -Rf /usr/share/man && \
    dnf clean all --enablerepo='*'

RUN cd /lib/systemd/system/sysinit.target.wants/; \
    for i in *; do [ $i = systemd-tmpfiles-setup.service ] || rm -f $i; done

RUN rm -f /lib/systemd/system/multi-user.target.wants/* \
    /etc/systemd/system/*.wants/* \
    /lib/systemd/system/local-fs.target.wants/* \
    /lib/systemd/system/sockets.target.wants/*udev* \
    /lib/systemd/system/sockets.target.wants/*initctl* \
    /lib/systemd/system/basic.target.wants/* \
    /lib/systemd/system/anaconda.target.wants/*

# Disable requiretty.
RUN sed -i -e 's/^\(Defaults\s*requiretty\)/#--- \1/'  /etc/sudoers

# Custom bashrc
RUN printf "# .bashrc \n\n\
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