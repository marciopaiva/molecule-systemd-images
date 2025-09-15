# Ubuntu Images

Container images for testing Ansible roles with Molecule using Ubuntu distributions.

## Available Tags

**LTS Releases (Recommended):**
- `latest`, `24.04` - Ubuntu 24.04 LTS Noble (until 2029)
- `22.04` - Ubuntu 22.04 LTS Jammy (until 2027)
- `20.04` - Ubuntu 20.04 LTS Focal (until 2025)
- `18.04` - Ubuntu 18.04 LTS Bionic (until 2023)

**Regular Releases:**
- `23.04` - Ubuntu 23.04 Lunar (EOL)
- `21.04` - Ubuntu 21.04 Hirsute (EOL)
- `19.10` - Ubuntu 19.10 Eoan (EOL)

## Usage

```yaml
platforms:
  - name: ubuntu-24
    image: quay.io/mpaivabarbosa/molecule-systemd-ubuntu:24.04
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

## LTS Recommendations

For production testing, prefer LTS versions:
- Ubuntu 24.04 LTS (until 2029)
- Ubuntu 22.04 LTS (until 2027)
- Ubuntu 20.04 LTS (until 2025)

## Important Note

⚠️ **These images are designed for testing purposes only and should NOT be used in production environments.** The configuration is optimized for Molecule testing scenarios and may not be suitable for secure production deployments.