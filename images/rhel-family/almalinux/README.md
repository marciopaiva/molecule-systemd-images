# AlmaLinux Images

![Docker Pulls](https://img.shields.io/docker/pulls/mpaivabarbosa/molecule-systemd-almalinux?logo=docker&label=pulls)
![Docker Image Size](https://img.shields.io/docker/image-size/mpaivabarbosa/molecule-systemd-almalinux/latest?logo=docker&label=size)
![AlmaLinux](https://img.shields.io/badge/almalinux-10-lightblue?logo=almalinux)
![Systemd](https://img.shields.io/badge/systemd-enabled-green?logo=systemd)

AlmaLinux is an open-source, community-driven Linux operating system that fills the gap left by the discontinuation of the CentOS Linux stable release.

**Repository:** https://github.com/marciopaiva/molecule-systemd-images

## Available Tags

- `latest`, `10` - AlmaLinux 10 (recommended)
- `9` - AlmaLinux 9
- `8` - AlmaLinux 8

## Usage

```yaml
platforms:
  - name: almalinux-10
    image: mpaivabarbosa/molecule-systemd-almalinux:10
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

## Why AlmaLinux?

- ✅ **1:1 Binary Compatible** with RHEL
- ✅ **Community Driven** - Owned and governed by the community
- ✅ **Long-term Support** - ~10 years per major version
- ✅ **Free Forever** - No license costs
- ✅ **CentOS Replacement** - Drop-in replacement for CentOS Linux

## Use Cases

- Testing roles for RHEL environments without licensing
- Migrating from CentOS Linux
- Enterprise application compatibility testing
- CI/CD pipelines requiring RHEL-like systems

## Image Sizes

| Tag | Size | Python Version | systemd Version |
|-----|------|----------------|----------------|
| 10  | ~300MB | 3.12 | 259+ |
| 9   | ~280MB | 3.9  | 252+ |
| 8   | ~260MB | 3.6  | 239+ |

## Common Issues

**Issue: SELinux in container**
```yaml
# SELinux is disabled by default in containers
# If needed, add: --security-opt label=disable
```

**Issue: Systemd fails to start**
```yaml
# Ensure proper cgroup configuration
platforms:
  - name: almalinux
    privileged: true
    cgroupns_mode: host
```

## Links

- [AlmaLinux Official](https://almalinux.org/)
- [AlmaLinux Wiki](https://wiki.almalinux.org/)
- [Release Notes](https://wiki.almalinux.org/release-notes/)
- [Package Repository](https://repo.almalinux.org/)

## Important Note

⚠️ **These images are designed for testing purposes only and should NOT be used in production environments.** The configuration is optimized for Molecule testing scenarios and may not be suitable for secure production deployments.