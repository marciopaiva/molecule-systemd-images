# Amazon Linux Images

Container images for testing Ansible roles with Molecule using Amazon Linux distributions.

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