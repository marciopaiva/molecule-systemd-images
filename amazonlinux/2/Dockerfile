FROM amazonlinux:2

LABEL summary="Molecule Systemd Amazon Linux" \
      name="mpaivabarbosa/molecule-systemd-amazonlinux" \
      maintainer="Marcio Barbosa <mpaivabarbosa@gmail.com>"

ENV container docker

RUN yum makecache fast && \
    yum update -y && \
    yum install -y --setopt=tsflags=nodocs **systemd** python3 yum-plugin-ovl sudo bash iproute && \ 
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