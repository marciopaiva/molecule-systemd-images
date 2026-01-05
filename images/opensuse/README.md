# openSUSE Leap Container Images for Molecule

![openSUSE Leap](https://img.shields.io/badge/openSUSE%20Leap-15.6-73ba25?logo=opensuse)

Pre-built openSUSE Leap container images for testing Ansible roles using Molecule.

## Available Tags

**LTS Releases:**
- `latest`, `15.6` - openSUSE Leap 15.6 (until 2025-12)
- `15.5` - openSUSE Leap 15.5 (until 2024-12)
- `15.4` - openSUSE Leap 15.4 (until 2023-12)

## Features

- **systemd** enabled and configured
- **Python 3** and **pip** pre-installed
- **ansible** user with passwordless sudo
- Optimized for Molecule testing

## Usage Example

```yaml
---
platforms:
  - name: opensuse-15-6
    image: docker.io/mpaivabarbosa/molecule-systemd-opensuse:15.6
    pre_build_image: true
    privileged: true
    command: /usr/lib/systemd/systemd
    volumes:
      - /sys/fs/cgroup:/sys/fs/cgroup:rw
    cgroupns_mode: host
```

## About openSUSE Leap

openSUSE Leap is a stable, community-supported Linux distribution based on SUSE Linux Enterprise (SLE). 

- **Release Cycle**: 12-18 months support per version
- **Use Cases**: Enterprise servers, workstations, development
- **Package Manager**: zypper (RPM-based)
- **Init System**: systemd

## Docker Hub

https://hub.docker.com/r/mpaivabarbosa/molecule-systemd-opensuse

## Source Code

https://github.com/marciopaiva/molecule-systemd-images
