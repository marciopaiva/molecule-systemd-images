# Molecule Systemd Images

![Travis (.com)](https://img.shields.io/travis/com/marciopaiva/molecule-systemd-images)
![GitHub last commit](https://img.shields.io/github/last-commit/marciopaiva/molecule-systemd-images)
![GitHub](https://img.shields.io/github/license/marciopaiva/molecule-systemd-images)

Base container images for testing using Ansible Molecule test framework

## About Ansible Molecule

Molecule project is designed to aid in the development and testing of Ansible roles.

Molecule provides support for testing with multiple instances, operating systems and distributions, virtualization providers, test frameworks and testing scenarios.

Molecule encourages an approach that results in consistently developed roles that are well-written, easily understood and maintained.

## Supported Images

  * [Amazon Linux](https://hub.docker.com/r/mpaivabarbosa/molecule-systemd-amazonlinux)
    *  `latest`, `2`
  
  * [CentOS](https://hub.docker.com/r/mpaivabarbosa/molecule-systemd-centos)
    * `latest`, `8`
    * `7`

  * [Debian](https://hub.docker.com/r/mpaivabarbosa/molecule-systemd-debian)
    * `latest`, `10`
    * `9`

  * [Fedora](https://hub.docker.com/r/mpaivabarbosa/molecule-systemd-fedora)
    * `latest`, `32`
    * `31`

  * [Ubuntu](https://hub.docker.com/r/mpaivabarbosa/molecule-systemd-ubuntu)
    * `latest`, `20.04`
    * `19.10`
    * `18.04`

## How to Use

Edit the `platforms` section of file `molecule/default/molecule.yml`:

``` yml
...

platforms:
- name: amazonlinux-2
  hostname: amazonlinux
  image: mpaivabarbosa/molecule-systemd-amazonlinux:2
  volumes:
    - /sys/fs/cgroup:/sys/fs/cgroup:ro
  privileged: true
  pre_build_image: true
  override_command: false

...
```

## Important Note

I use this image for testing roles and playbooks using Ansible Molecule running locally inside in an isolated environment — not for production — and the settings and configuration used may not be suitable for a secure and performant production environment.
