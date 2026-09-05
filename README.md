# Molecule Systemd Images

![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/marciopaiva/molecule-systemd-images/build.yml?logo=github&label=build)
![GitHub Release](https://img.shields.io/github/v/release/marciopaiva/molecule-systemd-images?logo=github&label=release)
![GitHub last commit](https://img.shields.io/github/last-commit/marciopaiva/molecule-systemd-images?logo=github)
![GitHub](https://img.shields.io/github/license/marciopaiva/molecule-systemd-images?logo=github)

![Docker Pulls](https://img.shields.io/docker/pulls/mpaivabarbosa/molecule-systemd-ubuntu?logo=docker&label=docker%20pulls)
![Docker Image Size](https://img.shields.io/docker/image-size/mpaivabarbosa/molecule-systemd-ubuntu/latest?logo=docker&label=image%20size)
![Supported Platforms](https://img.shields.io/badge/platforms-42%20images-blue?logo=docker)
![Distributions](https://img.shields.io/badge/distributions-9%20families-green?logo=linux)

![Ansible](https://img.shields.io/badge/ansible-molecule%20ready-red?logo=ansible)
![Podman](https://img.shields.io/badge/podman-supported-purple?logo=podman)
![Systemd](https://img.shields.io/badge/systemd-enabled-orange?logo=systemd)

Base container images for testing using the Ansible Molecule test framework, with Podman support.

⚠️ **These images are built for testing roles and playbooks with Ansible Molecule in isolated environments, not for production use.** The configuration is optimized for Molecule testing scenarios and may not be suitable for secure, performant production deployments.

---

## 📑 Table of Contents

- [Quick Start](#quick-start)
- [About Ansible Molecule](#about-ansible-molecule)
- [Supported Images](#supported-images)
- [Distribution Comparison](#distribution-comparison)
- [Full Example Configuration](#full-example-configuration)
- [Requirements](#requirements)
- [Building Images Locally](#building-images-locally)
- [Performance Tips](#performance-tips)
- [Troubleshooting](#troubleshooting)
- [Migration from Docker](#migration-from-docker)
- [Features](#features)
- [Project Structure](#project-structure)
- [Contributing](#contributing)
- [License](#license)

## Quick Start

```bash
# Install requirements
pip install molecule molecule-plugins[podman]
ansible-galaxy collection install containers.podman community.docker ansible.posix
```

```yaml
# molecule/default/molecule.yml
driver:
  name: containers
platforms:
  - name: ubuntu-test
    image: mpaivabarbosa/molecule-systemd-ubuntu:26.04
    privileged: true
    volumes:
      - /sys/fs/cgroup:/sys/fs/cgroup:ro
provisioner:
  name: ansible
verifier:
  name: ansible
```

```bash
molecule test
```

## About Ansible Molecule

Molecule is designed to aid in the development and testing of Ansible roles.

It provides support for testing with multiple instances, operating systems and distributions, virtualization providers, test frameworks and testing scenarios.

Molecule encourages an approach that results in consistently developed roles that are well-written, easily understood and maintained.

## Supported Images

**42 container images** across **9 distributions**:

> All images are automatically built, smoke tested and scanned for vulnerabilities via GitHub Actions before being pushed.

  * **[Amazon Linux](https://hub.docker.com/r/mpaivabarbosa/molecule-systemd-amazonlinux)**
    * `latest`, `2023`
    * `2` (EOL since 2026-06-30)

  * **[CentOS](https://hub.docker.com/r/mpaivabarbosa/molecule-systemd-centos)** (Legacy)
    * `8`, `7`

  * **[Rocky Linux](https://hub.docker.com/r/mpaivabarbosa/molecule-systemd-rockylinux)**
    * `latest`, `10`
    * `9`, `8`

  * **[AlmaLinux](https://hub.docker.com/r/mpaivabarbosa/molecule-systemd-almalinux)**
    * `latest`, `10`
    * `9`, `8`

  * **[Oracle Linux](https://hub.docker.com/r/mpaivabarbosa/molecule-systemd-oraclelinux)**
    * `latest`, `10`
    * `9`, `8`

  * **[Debian](https://hub.docker.com/r/mpaivabarbosa/molecule-systemd-debian)**
    * `latest`, `13`
    * `12`, `11`, `10`, `9`

  * **[Fedora](https://hub.docker.com/r/mpaivabarbosa/molecule-systemd-fedora)**
    * `latest`, `44`
    * `43`, `42`, `41`, `40`, `39`, `38`, `37`, `36`, `32`, `31`

  * **[Ubuntu](https://hub.docker.com/r/mpaivabarbosa/molecule-systemd-ubuntu)**
    * `latest`, `26.04`
    * `24.04`, `23.04`, `22.04`, `21.04`, `20.04`, `19.10`, `18.04`

  * **[openSUSE Leap](https://hub.docker.com/r/mpaivabarbosa/molecule-systemd-opensuse)**
    * `latest`, `16.0`
    * `15.6`, `15.5`, `15.4`

  * **[Arch Linux](https://hub.docker.com/r/mpaivabarbosa/molecule-systemd-archlinux)**
    * `latest` (rolling release)

## Distribution Comparison

| Distribution | Use Case | Package Manager | Release Cycle | Best For |
|--------------|----------|-----------------|---------------|----------|
| **Amazon Linux 2023** | AWS workloads | yum/dnf | Rolling | AWS-specific testing, Lambda functions |
| **Rocky Linux 10** | RHEL alternative | dnf | ~10 years | Enterprise, CentOS replacement |
| **AlmaLinux 10** | RHEL alternative | dnf | ~10 years | Enterprise, latest RHEL features |
| **Oracle Linux 10** | Enterprise | dnf | ~10 years | Oracle DB, enterprise apps |
| **Debian 13** | Stability | apt | ~5 years | General purpose, stable environments |
| **Ubuntu 26.04 LTS** | Modern & popular | apt | 5 years (LTS) | Cloud, DevOps, modern tooling |
| **Fedora 44** | Cutting edge | dnf | ~6 months | Latest features, development |
| **openSUSE Leap 16.0** | SUSE Enterprise | zypper | 18 months | SUSE environments, SAP workloads |
| **Arch Linux** | Bleeding edge | pacman | Rolling | Latest software, development |

**Quick Selection Guide:**
- 🏢 **Enterprise/Production-like:** Rocky Linux, AlmaLinux, Oracle Linux
- ☁️ **Cloud Native:** Ubuntu LTS, Amazon Linux
- 🔬 **Development/Testing:** Fedora, Debian, Arch Linux
- 🏛️ **SUSE Environments:** openSUSE Leap
- 🚀 **Bleeding Edge:** Arch Linux, Fedora
- 📦 **Legacy Support:** CentOS (EOL)

## Full Example Configuration

For a starter `molecule.yml` covering every RHEL, Debian and Fedora family with `dependency`, `provisioner`, `verifier` and a full `test_sequence` already wired up, copy [`examples/molecule.yml`](examples/molecule.yml) and [`examples/requirements.yml`](examples/requirements.yml) into your role, see [`examples/README.md`](examples/README.md).

A minimal excerpt, showing a few distributions at once:

```yaml
---
dependency:
  name: galaxy

driver:
  name: containers

platforms:
  - name: rockylinux-10
    hostname: rockylinux
    image: mpaivabarbosa/molecule-systemd-rockylinux:10
    volumes:
      - /sys/fs/cgroup:/sys/fs/cgroup:ro
    privileged: true
    pre_build_image: true
    override_command: false

  - name: debian-13
    hostname: debian
    image: mpaivabarbosa/molecule-systemd-debian:13
    volumes:
      - /sys/fs/cgroup:/sys/fs/cgroup:ro
    privileged: true
    pre_build_image: true
    override_command: false

  - name: opensuse-leap-16
    hostname: opensuse
    image: mpaivabarbosa/molecule-systemd-opensuse:16.0
    volumes:
      - /sys/fs/cgroup:/sys/fs/cgroup:rw
    privileged: true
    pre_build_image: true
    override_command: false

provisioner:
  name: ansible
  config_options:
    defaults:
      remote_user: ansible

verifier:
  name: ansible
```

## Requirements

- Ansible Molecule (CalVer releases, e.g. 26.x) with `molecule-plugins[podman]`
- `containers.podman`, `community.docker` and `ansible.posix` collections
- Podman >= 4.0

Install requirements:

```bash
pip install molecule molecule-plugins[podman]
ansible-galaxy collection install containers.podman community.docker ansible.posix
```

## Building Images Locally

Use the included scripts and Makefile:

```bash
# Build all images using script
./scripts/build-all.sh

# Build using Makefile
make build

# Build specific distributions
make amazonlinux    # Amazon Linux images
make centos         # CentOS images
make rockylinux     # Rocky Linux images
make almalinux      # AlmaLinux images
make oraclelinux    # Oracle Linux images
make debian         # Debian images
make fedora         # Fedora images
make ubuntu         # Ubuntu images
make opensuse       # openSUSE Leap images
make archlinux      # Arch Linux image

# Test specific image
./scripts/test-image.sh ubuntu 24.04
make test IMAGE=ubuntu:24.04

# Run integration tests
python3 tests/integration/test_basic.py mpaivabarbosa/molecule-systemd-ubuntu:24.04

# List and manage images
make list           # List built images
make sizes          # Show image sizes
make clean          # Clean up

# Use different container engine
make build CONTAINER_ENGINE=docker
./scripts/build-all.sh CONTAINER_ENGINE=docker

# Show all available targets
make help
```

## Performance Tips

### CI/CD Optimization

**1. Use pre-built images:**
```yaml
platforms:
  - name: ubuntu-test
    image: mpaivabarbosa/molecule-systemd-ubuntu:26.04
    pre_build_image: true  # Don't rebuild, use from registry
```

**2. Cache in GitHub Actions:**
```yaml
- name: Cache Podman images
  uses: actions/cache@v4
  with:
    path: ~/.local/share/containers
    key: ${{ runner.os }}-podman-${{ hashFiles('**/molecule.yml') }}
```

**3. Parallel testing:**
```bash
# Run multiple distributions in parallel
molecule test --parallel
```

**4. Selective testing:**
```yaml
# Test only on changed platforms
platforms:
  - name: ubuntu-test
    image: mpaivabarbosa/molecule-systemd-ubuntu:26.04
```

### Local Development

- **Reuse containers:** Use `molecule converge` instead of `molecule test` for iterative development
- **Limit platforms:** Comment out unused platforms during development
- **Use latest tags:** For development, use `:latest` tags to get updates automatically

## Troubleshooting

### Common Issues

**Problem: "Failed to connect to bus: Host is down"**
```yaml
# Solution: Ensure systemd is properly configured
platforms:
  - name: instance
    privileged: true
    volumes:
      - /sys/fs/cgroup:/sys/fs/cgroup:rw  # Note: rw for some distros
    command: /usr/lib/systemd/systemd  # or /usr/sbin/init
```

**Problem: "Permission denied" or sudo issues**
```yaml
# Solution: Use the pre-configured ansible user
provisioner:
  name: ansible
  config_options:
    defaults:
      remote_user: ansible  # This user has passwordless sudo
```

**Problem: "Container image not found"**
```bash
# Solution: Check image name and pull manually
podman pull docker.io/mpaivabarbosa/molecule-systemd-ubuntu:26.04
```

**Problem: Slow container startup**
```yaml
# Solution: Disable unnecessary systemd services in prepare.yml
# (molecule/default/prepare.yml)
---
- name: Prepare
  hosts: all
  tasks:
    - name: Disable unwanted service
      ansible.builtin.systemd:
        name: unwanted.service
        enabled: false
        masked: true
```

**Problem: cgroup v2 issues on older systems**
```bash
# Solution: Use cgroup v1 compatibility
podman run --cgroupns=host --cgroup-manager=cgroupfs ...
```

### Debug Mode

Enable verbose output:
```bash
# Molecule debug
molecule --debug test

# Podman debug
podman --log-level=debug run ...

# Ansible debug
molecule test -- -vvv
```

### Getting Help

- 📖 [Full Documentation](docs/)
- 🐛 [Report Issues](https://github.com/marciopaiva/molecule-systemd-images/issues)
- 💬 [Discussions](https://github.com/marciopaiva/molecule-systemd-images/discussions)
- 📚 [Molecule Docs](https://docs.ansible.com/projects/molecule/)
- 🔧 [Troubleshooting Guide](docs/TROUBLESHOOTING.md)

## Migration from Docker

If migrating from Docker to Podman:

1. Install Podman: `sudo apt install podman` (Ubuntu/Debian) or `sudo dnf install podman` (Fedora/RHEL)
2. Update `molecule.yml` driver from `docker` to `containers`
3. Install required collections: `ansible-galaxy collection install containers.podman community.docker ansible.posix`
4. Update image URLs to use the Docker Hub registry

## Features

- **Systemd support** - Full systemd initialization for realistic testing
- **Ansible ready** - Pre-configured ansible user with sudo privileges
- **Molecule optimized** - Designed specifically for Molecule (containers driver) testing
- **Multi-architecture** - Built for amd64 architecture
- **Minimal footprint** - Optimized image sizes with essential packages only
- **EOL support** - Includes End-of-Life distributions with corrected repositories
- **CI verified** - Every build is smoke tested (systemd boot, sudo) and scanned for vulnerabilities before being pushed

## Project Structure

```
molecule-systemd-images/
├── images/
│   ├── rhel-family/     # RHEL-based distributions
│   │   ├── amazonlinux/
│   │   ├── centos/
│   │   ├── rockylinux/
│   │   ├── almalinux/
│   │   └── oraclelinux/
│   ├── debian-family/   # Debian-based distributions
│   │   ├── debian/
│   │   └── ubuntu/
│   ├── fedora/          # Fedora releases
│   ├── opensuse/        # openSUSE Leap releases
│   └── archlinux/       # Arch Linux (rolling release)
├── templates/           # Dockerfile templates
├── scripts/             # Build and test scripts
├── docs/                # Documentation
├── tests/               # Test suites
└── examples/            # Usage examples
```

## Contributing

See [docs/CONTRIBUTING.md](docs/CONTRIBUTING.md) for detailed guidelines.

**Quick start:**
1. Fork the repository
2. Create a feature branch
3. Add new OS versions or improvements
4. Test with `./scripts/build-all.sh` and `./scripts/test-image.sh`
5. Submit a pull request

## License

MIT License, see [LICENSE](LICENSE) file for details.
