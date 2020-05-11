# Molecule Systemd Images

Base container images for testing using Ansible Molecule test framework

## About Ansible Molecule

Molecule project is designed to aid in the development and testing of Ansible roles.

Molecule provides support for testing with multiple instances, operating systems and distributions, virtualization providers, test frameworks and testing scenarios.

Molecule encourages an approach that results in consistently developed roles that are well-written, easily understood and maintained.

## Supported Images
 - [Amazon Linux](https://hub.docker.com/r/mpaivabarbosa/molecule-systemd-amazonlinux)
 `latest`, `2`

 - [CentOS](https://hub.docker.com/r/mpaivabarbosa/molecule-systemd-centos)
   `latest`, `8`
   `7`

 - [Debian](https://hub.docker.com/r/mpaivabarbosa/molecule-systemd-debian)
   `latest`, `10`
   `9`

## Important Note

I use this image for testing roles and playbooks using Ansible Molecule running locally inside in an isolated environment — not for production — and the settings and configuration used may not be suitable for a secure and performant production environment.
