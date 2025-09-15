# Local Testing Guide

## Current Environment Status

✅ **Installed:**
- Podman 5.4.0
- Python 3.9.21
- Ansible 2.16.14
- RHEL 9.6

❌ **Missing:**
- Molecule
- containers.podman collection

## Required Setup

### 1. Install Molecule

```bash
# Install Molecule with containers support
pip3 install --user molecule[containers]

# Add to PATH if needed
echo 'export PATH=$HOME/.local/bin:$PATH' >> ~/.bashrc
source ~/.bashrc
```

### 2. Install Ansible Collections

```bash
# Install containers.podman collection
ansible-galaxy collection install containers.podman

# Verify installation
ansible-galaxy collection list | grep containers.podman
```

### 3. Test Build Locally

```bash
# Test building a single image
make amazonlinux CONTAINER_ENGINE=podman

# Test building all images (takes time)
make build

# Clean up test images
make clean
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