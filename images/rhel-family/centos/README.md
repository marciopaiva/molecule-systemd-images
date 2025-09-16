# CentOS Images (Legacy)

![Docker Pulls](https://img.shields.io/docker/pulls/mpaivabarbosa/molecule-systemd-centos?logo=docker&label=pulls)
![Docker Image Size](https://img.shields.io/docker/image-size/mpaivabarbosa/molecule-systemd-centos/8?logo=docker&label=size)
![CentOS](https://img.shields.io/badge/centos-8-red?logo=centos)
![EOL](https://img.shields.io/badge/status-EOL-red)
![Systemd](https://img.shields.io/badge/systemd-enabled-green?logo=systemd)

Container images for testing Ansible roles with Molecule using CentOS distributions.

**Repository:** https://github.com/marciopaiva/molecule-systemd-images

⚠️ **Note**: CentOS is now in maintenance mode. Consider migrating to Rocky Linux or AlmaLinux for new projects.

## Available Tags

- `8` - CentOS 8 (EOL)
- `7` - CentOS 7 (EOL)

## Usage

```yaml
platforms:
  - name: centos-8
    image: mpaivabarbosa/molecule-systemd-centos:8
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

## Migration Path

Consider migrating to:
- [Rocky Linux](../rockylinux/) - 1:1 compatible replacement
- [AlmaLinux](../almalinux/) - Community-driven alternative

## Important Note

⚠️ **These images are designed for testing purposes only and should NOT be used in production environments.** The configuration is optimized for Molecule testing scenarios and may not be suitable for secure production deployments.