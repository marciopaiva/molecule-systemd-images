# Local Testing Guide

## Current Environment Status

✅ **Installed:**
- Podman 5.7.1
- Python 3.13.3
- Ansible 2.18.3
- Molecule 25.12.0
- Fedora Linux 42 (WSL)

✅ **Collections:**
- containers.podman 1.16.3
- community.docker 4.4.0

## Quick Start

### Build Specific Distribution

```bash
# Build latest versions
make amazonlinux    # Amazon Linux 2, 2023
make rockylinux     # Rocky Linux 8, 9
make almalinux      # AlmaLinux 8, 9, 10
make oraclelinux    # Oracle Linux 8, 9, 10
make debian         # Debian 9-13
make fedora         # Fedora 31, 32, 36-42
make ubuntu         # Ubuntu 18.04-24.04

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

### 4. Verify Molecule Setup

```bash
# Check Molecule version
molecule --version

# Test Molecule with containers driver
molecule init role test-role --driver-name containers
cd test-role
molecule test
```

## Quick Start Commands

```bash
# Install everything at once
pip3 install --user molecule[containers] && \
ansible-galaxy collection install containers.podman

# Build specific OS
make rockylinux
make ubuntu

# Build and push (requires registry login)
make build
make release
```

## Troubleshooting

### Permission Issues
```bash
# Add user to podman group if needed
sudo usermod -aG podman $USER
newgrp podman
```

### Registry Login
```bash
# Login to Quay.io
podman login quay.io
```

### Build Issues
```bash
# Check Podman status
podman info

# Test simple build
podman build -t test ./ubuntu/24.04
```

## Testing Workflow

1. **Build locally**: `make build`
2. **Test image**: `podman run -it --rm <image> /bin/bash`
3. **Verify systemd**: `podman run -d --privileged <image>`
4. **Clean up**: `make clean`