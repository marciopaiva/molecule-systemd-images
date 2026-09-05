# Local Testing Guide

## Requirements

- Podman >= 4.0
- Python 3.9+
- Ansible Molecule (CalVer releases, e.g. 26.x) with `molecule-plugins[podman]`
- Ansible collections: `containers.podman`, `community.docker`, `ansible.posix`

## Quick Start

### Install Everything

```bash
pip install molecule molecule-plugins[podman]
ansible-galaxy collection install containers.podman community.docker ansible.posix
```

### Build Specific Distribution

```bash
# Build latest versions
make amazonlinux    # Amazon Linux 2023
make rockylinux     # Rocky Linux 8, 9, 10
make almalinux      # AlmaLinux 8, 9, 10
make oraclelinux    # Oracle Linux 8, 9, 10
make debian         # Debian 9-13
make fedora         # Fedora 31, 32, 36-44
make ubuntu         # Ubuntu 18.04-24.04, 26.04
make opensuse       # openSUSE Leap 15.4-15.6, 16.0
make archlinux      # Arch Linux (rolling)

# Build all images
make build
```

### Test Individual Image

```bash
# Run interactive shell
podman run -it --rm mpaivabarbosa/molecule-systemd-almalinux:10 /bin/bash

# Test systemd
podman run -d --privileged mpaivabarbosa/molecule-systemd-oraclelinux:10

# Check OS version
podman run --rm mpaivabarbosa/molecule-systemd-almalinux:10 cat /etc/os-release
```

### Verify Molecule Setup

```bash
# Check Molecule version and installed drivers
molecule --version
molecule drivers

# Test Molecule with the containers driver
molecule init role test-role --driver-name containers
cd test-role
molecule test
```

## Troubleshooting

### Permission Issues
```bash
# Add user to podman group if needed
sudo usermod -aG podman $USER
newgrp podman
```

### Registry Login

Images are published to Docker Hub under `mpaivabarbosa/`:
```bash
podman login docker.io
```

### Build Issues
```bash
# Check Podman status
podman info

# Test simple build
podman build -t test ./images/debian-family/ubuntu/24.04
```

## Testing Workflow

1. **Build locally**: `make build`
2. **Test image**: `podman run -it --rm <image> /bin/bash`
3. **Verify systemd**: `podman run -d --privileged <image>`
4. **Clean up**: `make clean`
