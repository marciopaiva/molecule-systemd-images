# Rocky Linux Images

![Docker Pulls](https://img.shields.io/docker/pulls/mpaivabarbosa/molecule-systemd-rockylinux?logo=docker&label=pulls)
![Docker Image Size](https://img.shields.io/docker/image-size/mpaivabarbosa/molecule-systemd-rockylinux/latest?logo=docker&label=size)
![Rocky Linux](https://img.shields.io/badge/rocky%20linux-9-blue?logo=rockylinux)
![Systemd](https://img.shields.io/badge/systemd-enabled-green?logo=systemd)

Rocky Linux is a community enterprise operating system designed to be 100% bug-for-bug compatible with Red Hat Enterprise Linux.

**Repository:** https://github.com/marciopaiva/molecule-systemd-images

## Available Tags

- `latest`, `9` - Rocky Linux 9 (recommended)
- `8` - Rocky Linux 8

## Usage

```yaml
platforms:
  - name: rockylinux-9
    image: mpaivabarbosa/molecule-systemd-rockylinux:9
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