# Amazon Linux Images

![Docker Pulls](https://img.shields.io/docker/pulls/mpaivabarbosa/molecule-systemd-amazonlinux?logo=docker&label=pulls)
![Docker Image Size](https://img.shields.io/docker/image-size/mpaivabarbosa/molecule-systemd-amazonlinux/latest?logo=docker&label=size)
![Amazon Linux](https://img.shields.io/badge/amazon%20linux-2023-orange?logo=amazon)
![Systemd](https://img.shields.io/badge/systemd-enabled-green?logo=systemd)

Container images for testing Ansible roles with Molecule using Amazon Linux distributions.

**Repository:** https://github.com/marciopaiva/molecule-systemd-images

## Available Tags

- `latest`, `2023` - Amazon Linux 2023 (recommended)
- `2` - Amazon Linux 2

## Usage

```yaml
platforms:
  - name: amazonlinux-2023
    image: mpaivabarbosa/molecule-systemd-amazonlinux:2023
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