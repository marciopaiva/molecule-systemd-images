# Debian Images

Container images for testing Ansible roles with Molecule using Debian distributions.

## Available Tags

**Current Releases:**
- `latest`, `13` - Debian 13 Trixie (recommended)
- `12` - Debian 12 Bookworm
- `11` - Debian 11 Bullseye
- `10` - Debian 10 Buster

**Legacy/EOL Releases:**
- `9` - Debian 9 Stretch (EOL)

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