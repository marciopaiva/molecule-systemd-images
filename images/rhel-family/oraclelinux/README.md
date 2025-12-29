# Oracle Linux Images

![Docker Pulls](https://img.shields.io/docker/pulls/mpaivabarbosa/molecule-systemd-oraclelinux?logo=docker&label=pulls)
![Docker Image Size](https://img.shields.io/docker/image-size/mpaivabarbosa/molecule-systemd-oraclelinux/latest?logo=docker&label=size)
![Oracle Linux](https://img.shields.io/badge/oraclelinux-10-red?logo=oracle)
![Systemd](https://img.shields.io/badge/systemd-enabled-green?logo=systemd)

Oracle Linux is an open-source operating system available under the GNU General Public License (GPLv2). Optimized for open cloud infrastructure, it delivers leading performance, scalability, reliability, and security for enterprise SaaS and on-premises workloads.

**Repository:** https://github.com/marciopaiva/molecule-systemd-images

## Available Tags

- `latest`, `10` - Oracle Linux 10 (recommended)
- `9` - Oracle Linux 9
- `8` - Oracle Linux 8

## Usage

```yaml
platforms:
  - name: oraclelinux-10
    image: mpaivabarbosa/molecule-systemd-oraclelinux:10
    volumes:
      - /sys/fs/cgroup:/sys/fs/cgroup:ro
    privileged: true
    pre_build_image: true
```

## Features

- Systemd enabled
- Python 3 installed
- Ansible user with sudo privileges
- Optimized for Molecule testing

## Important Note

⚠️ **These images are designed for testing purposes only and should NOT be used in production environments.** The configuration is optimized for Molecule testing scenarios and may not be suitable for secure production deployments.
