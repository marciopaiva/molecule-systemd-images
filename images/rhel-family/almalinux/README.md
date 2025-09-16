# AlmaLinux Images

![Docker Pulls](https://img.shields.io/docker/pulls/mpaivabarbosa/molecule-systemd-almalinux?logo=docker&label=pulls)
![Docker Image Size](https://img.shields.io/docker/image-size/mpaivabarbosa/molecule-systemd-almalinux/latest?logo=docker&label=size)
![AlmaLinux](https://img.shields.io/badge/almalinux-9-lightblue?logo=almalinux)
![Systemd](https://img.shields.io/badge/systemd-enabled-green?logo=systemd)

AlmaLinux is an open-source, community-driven Linux operating system that fills the gap left by the discontinuation of the CentOS Linux stable release.

**Repository:** https://github.com/marciopaiva/molecule-systemd-images

## Available Tags

- `latest`, `9` - AlmaLinux 9 (recommended)
- `8` - AlmaLinux 8

## Usage

```yaml
platforms:
  - name: almalinux-9
    image: mpaivabarbosa/molecule-systemd-almalinux:9
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