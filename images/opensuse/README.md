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

## Why openSUSE Leap?

- ✅ **Enterprise Foundation** - Based on SUSE Linux Enterprise (SLE)
- ✅ **Stability** - 18-month support cycle per version
- ✅ **Professional Use** - Widely used in corporate environments
- ✅ **YaST Integration** - Powerful system configuration tool
- ✅ **Btrfs by Default** - Advanced filesystem features

## Use Cases

- Testing roles for SUSE Linux Enterprise environments
- SAP workload compatibility testing
- Zypper package manager testing
- Enterprise Linux (non-RHEL) validation
- openSUSE/SUSE-specific application testing

## Image Sizes

| Tag | Size | Python Version | systemd Version | Support Until |
|-----|------|----------------|----------------|---------------|
| 15.6 | ~180MB | 3.6 | 254+ | December 2025 |
| 15.5 | ~175MB | 3.6 | 249+ | December 2024 |
| 15.4 | ~170MB | 3.6 | 249+ | December 2023 |

## Package Management

```bash
# Inside container - using zypper
zypper refresh                    # Update repository metadata
zypper install package_name       # Install package
zypper search keyword             # Search packages
zypper update                     # Update all packages
```

## Common Issues

**Issue: Group 'wheel' not found**
```bash
# openSUSE doesn't use 'wheel' group by default
# These images use sudoers.d for ansible user
```

**Issue: Zypper lock errors**
```bash
# Wait for zypper processes to complete
# Or use: zypper --non-interactive
```

## Differences from RHEL/Debian

| Feature | openSUSE | RHEL/CentOS | Debian/Ubuntu |
|---------|----------|-------------|---------------|
| Package Manager | zypper | yum/dnf | apt |
| Init System | systemd | systemd | systemd |
| Default Filesystem | Btrfs | XFS | ext4 |
| Config Tool | YaST | - | debconf |
| Release Cycle | 12-18 months | ~3 years | 2 years (stable) |

## Links

- [openSUSE Official](https://www.opensuse.org/)
- [openSUSE Leap Docs](https://doc.opensuse.org/)
- [Zypper Cheat Sheet](https://en.opensuse.org/SDB:Zypper_usage)
- [SUSE Package Hub](https://packagehub.suse.com/)

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
