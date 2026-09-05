# Debian Images

![Docker Pulls](https://img.shields.io/docker/pulls/mpaivabarbosa/molecule-systemd-debian?logo=docker&label=pulls)
![Docker Image Size](https://img.shields.io/docker/image-size/mpaivabarbosa/molecule-systemd-debian/latest?logo=docker&label=size)
![Debian](https://img.shields.io/badge/debian-13-red?logo=debian)
![Systemd](https://img.shields.io/badge/systemd-enabled-green?logo=systemd)

Container images for testing Ansible roles with Molecule using Debian distributions.

**Repository:** https://github.com/marciopaiva/molecule-systemd-images

## Available Tags

**Current Releases:**
- `latest`, `13` - Debian 13 Trixie (recommended)
- `12` - Debian 12 Bookworm

Debian 9, 10 and 11 reached End of Life (Debian 11's LTS ended 2026-08-31) and were removed from this project.

## Usage

```yaml
platforms:
  - name: debian-13
    image: mpaivabarbosa/molecule-systemd-debian:13
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