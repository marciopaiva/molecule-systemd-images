FROM ubuntu:20.04

LABEL summary="Molecule Systemd Ubuntu" \
      name="mpaivabarbosa/molecule-systemd-ubuntu" \
      maintainer="Marcio Barbosa <mpaivabarbosa@gmail.com>"

ENV container docker
ENV LC_ALL C
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends systemd systemd-cron python sudo bash ca-certificates && \
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

CMD [ "/lib/systemd/systemd" ]