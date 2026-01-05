# Arch Linux Container Images for Molecule

![Arch Linux](https://img.shields.io/badge/Arch%20Linux-rolling-1793D1?logo=archlinux)

Pre-built Arch Linux container images for testing Ansible roles using Molecule.

## Available Tags

**Rolling Release:**
- `latest` - Arch Linux (rolling release, always up-to-date)

## Features

- **systemd** enabled and configured
- **Python 3** and **pip** pre-installed
- **ansible** user with passwordless sudo
- Optimized for Molecule testing

## Why Arch Linux?

- ✅ **Bleeding Edge** - Latest software versions, cutting-edge packages
- ✅ **Rolling Release** - Continuous updates, no version upgrades
- ✅ **Pacman** - Fast, powerful package manager
- ✅ **AUR Support** - Largest community-maintained package repository
- ✅ **Lightweight** - Minimal base, install only what you need
- ✅ **Documentation** - Excellent Arch Wiki, comprehensive guides

## Use Cases

- Testing roles with latest software versions
- Validating compatibility with bleeding-edge packages
- Pacman package manager testing
- AUR helper integration testing
- Rolling release environment validation
- Development and CI/CD with latest tooling

## Image Size

| Tag | Size | Python Version | systemd Version | Update Frequency |
|-----|------|----------------|----------------|------------------|
| latest | ~190MB | 3.12+ | 256+ | Daily (rolling) |

## Package Management

```bash
# Inside container - using pacman
pacman -Syu                      # Full system update
pacman -S package_name           # Install package
pacman -Ss keyword               # Search packages
pacman -R package_name           # Remove package
pacman -Qi package_name          # Package info
```

## Common Issues

**Issue: Package conflicts during update**
```bash
# Arch requires regular full updates
pacman -Syu --noconfirm
```

**Issue: Keyring errors**
```bash
# Update keyring first
pacman -Sy archlinux-keyring --noconfirm
pacman -Syu --noconfirm
```

**Issue: Breaking changes**
```bash
# Read Arch Linux news before major updates
# https://archlinux.org/news/
```

## Differences from Other Distributions

| Feature | Arch Linux | Fedora | Debian/Ubuntu |
|---------|------------|--------|---------------|
| Release Model | Rolling | Semi-annual | Fixed releases |
| Package Manager | pacman | dnf | apt |
| Package Freshness | Bleeding edge | Recent | Stable/LTS |
| Init System | systemd | systemd | systemd |
| Default Shell | bash | bash | bash |
| Target Audience | Advanced users | Developers | General/Enterprise |

## Links

- [Arch Linux Official](https://archlinux.org/)
- [Arch Wiki](https://wiki.archlinux.org/)
- [Pacman Documentation](https://wiki.archlinux.org/title/Pacman)
- [AUR (Arch User Repository)](https://aur.archlinux.org/)
- [Arch Linux News](https://archlinux.org/news/)

## Usage Example

```yaml
---
platforms:
  - name: archlinux-latest
    image: docker.io/mpaivabarbosa/molecule-systemd-archlinux:latest
    pre_build_image: true
    privileged: true
    command: /usr/lib/systemd/systemd
    volumes:
      - /sys/fs/cgroup:/sys/fs/cgroup:rw
    cgroupns_mode: host
```

## Important Notes

⚠️ **Rolling Release Considerations:**
- Images are rebuilt regularly to stay current
- Breaking changes may occur without version bumps
- Always test in CI/CD before production deployment
- Consider pinning specific package versions in your roles

⚠️ **Best Practices:**
- Run `pacman -Syu` before installing packages
- Test roles frequently (weekly recommended)
- Monitor Arch Linux news for breaking changes
- Use specific package versions for critical dependencies
