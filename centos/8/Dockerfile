FROM centos:8

LABEL maintainer="Marcio Barbosa"

ENV container docker

RUN yum makecache --timer && yum install -y python3 sudo bash && yum clean all

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

ENV ANSIBLE_USER=ansible SUDO_GROUP=wheel DEPLOY_GROUP=deployer
RUN set -xe \
    && groupadd -r ${ANSIBLE_USER} \
    && groupadd -r ${DEPLOY_GROUP} \
    && useradd -m -g ${ANSIBLE_USER} ${ANSIBLE_USER} \
    && usermod -aG ${SUDO_GROUP} ${ANSIBLE_USER} \
    && usermod -aG ${DEPLOY_GROUP} ${ANSIBLE_USER} \
    && sed -i "/^%${SUDO_GROUP}/s/ALL\$/NOPASSWD:ALL/g" /etc/sudoers
    
VOLUME [ "/sys/fs/cgroup" ]

CMD ["/usr/sbin/init"]
