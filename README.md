# Molecule Systemd Images

![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/marciopaiva/molecule-systemd-images/build.yml?logo=github&label=build)
![GitHub Release](https://img.shields.io/github/v/release/marciopaiva/molecule-systemd-images?logo=github&label=release)
![GitHub last commit](https://img.shields.io/github/last-commit/marciopaiva/molecule-systemd-images?logo=github)
![GitHub](https://img.shields.io/github/license/marciopaiva/molecule-systemd-images?logo=github)

![Docker Pulls](https://img.shields.io/docker/pulls/mpaivabarbosa/molecule-systemd-ubuntu?logo=docker&label=docker%20pulls)
![Docker Image Size](https://img.shields.io/docker/image-size/mpaivabarbosa/molecule-systemd-ubuntu/latest?logo=docker&label=image%20size)
![Supported Platforms](https://img.shields.io/badge/platforms-30%20images-blue?logo=docker)
![Distributions](https://img.shields.io/badge/distributions-6%20families-green?logo=linux)

![Ansible](https://img.shields.io/badge/ansible-molecule%20ready-red?logo=ansible)
![Podman](https://img.shields.io/badge/podman-supported-purple?logo=podman)
![Systemd](https://img.shields.io/badge/systemd-enabled-orange?logo=systemd)

Base container images for testing using Ansible Molecule test framework with Podman support.

## Quick Start

```bash
# Install requirements
pip install molecule[containers]
ansible-galaxy collection install containers.podman

# Use in your molecule.yml
platforms:
  - name: ubuntu-test
    image: mpaivabarbosa/molecule-systemd-ubuntu:24.04
    privileged: true
    volumes:
      - /sys/fs/cgroup:/sys/fs/cgroup:ro

# Run tests
molecule test
```

## About Ansible Molecule

Molecule project is designed to aid in the development and testing of Ansible roles.

Molecule provides support for testing with multiple instances, operating systems and distributions, virtualization providers, test frameworks and testing scenarios.

Molecule encourages an approach that results in consistently developed roles that are well-written, easily understood and maintained.

## Supported Images

**30 container images** across **6 distributions** with **30 versions**:

> All images are automatically built and tested via GitHub Actions, ensuring reliability and consistency.

  * **[Amazon Linux](https://hub.docker.com/r/mpaivabarbosa/molecule-systemd-amazonlinux)**
    * `latest`, `2023`
    * `2`
  
  * **[CentOS](https://hub.docker.com/r/mpaivabarbosa/molecule-systemd-centos)** (Legacy)
    * `8`, `7`

  * **[Rocky Linux](https://hub.docker.com/r/mpaivabarbosa/molecule-systemd-rockylinux)**
    * `latest`, `9`
    * `8`

  * **[AlmaLinux](https://hub.docker.com/r/mpaivabarbosa/molecule-systemd-almalinux)**
    * `latest`, `10`
    * `9`, `8`

  * **[Debian](https://hub.docker.com/r/mpaivabarbosa/molecule-systemd-debian)**
    * `latest`, `13`
    * `12`, `11`, `10`, `9`

  * **[Fedora](https://hub.docker.com/r/mpaivabarbosa/molecule-systemd-fedora)**
    * `latest`, `42`
    * `41`, `40`, `39`, `38`, `37`, `36`, `32`, `31`

  * **[Ubuntu](https://hub.docker.com/r/mpaivabarbosa/molecule-systemd-ubuntu)**
    * `latest`, `24.04`
    * `23.04`, `22.04`, `21.04`, `20.04`, `19.10`, `18.04`

## How to Use with Podman

To use these images with Podman, edit the `platforms` section of file `molecule/default/molecule.yml` as follows:

```yml
---
dependency:
  name: galaxy

driver:
  name: containers

platforms:
- name: amazonlinux-2023
  hostname: amazonlinux
  image: mpaivabarbosa/molecule-systemd-amazonlinux:2023
  volumes:
    - /sys/fs/cgroup:/sys/fs/cgroup:ro
  privileged: true
  pre_build_image: true
  override_command: false

- name: rockylinux-9
  hostname: rockylinux
  image: mpaivabarbosa/molecule-systemd-rockylinux:9
  volumes:
    - /sys/fs/cgroup:/sys/fs/cgroup:ro
  privileged: true
  pre_build_image: true
  override_command: false

- name: almalinux-9
  hostname: almalinux
  image: mpaivabarbosa/molecule-systemd-almalinux:9
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

- name: fedora-42
  hostname: fedora
  image: mpaivabarbosa/molecule-systemd-fedora:42
  volumes:
    - /sys/fs/cgroup:/sys/fs/cgroup:ro
  privileged: true
  pre_build_image: true
  override_command: false

- name: ubuntu-24
  hostname: ubuntu
  image: mpaivabarbosa/molecule-systemd-ubuntu:24.04
  volumes:
    - /sys/fs/cgroup:/sys/fs/cgroup:ro
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

- Ansible Molecule >= 6.0
- containers.podman collection
- Podman >= 4.0

Install requirements:

```bash
pip install molecule[containers]
ansible-galaxy collection install containers.podman
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
make debian         # Debian images
make fedora         # Fedora images
make ubuntu         # Ubuntu images



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

## Migration from Docker

If migrating from Docker to Podman:

1. Install Podman: `sudo apt install podman` (Ubuntu/Debian) or `sudo dnf install podman` (Fedora/RHEL)
2. Update molecule.yml driver from `docker` to `containers`
3. Install containers.podman collection: `ansible-galaxy collection install containers.podman`
4. Update image URLs to use Docker Hub registry

## Features

- **Systemd support** - Full systemd initialization for realistic testing
- **Ansible ready** - Pre-configured ansible user with sudo privileges
- **Molecule optimized** - Designed specifically for Molecule v6+ testing
- **Multi-architecture** - Built for amd64 architecture
- **Minimal footprint** - Optimized image sizes with essential packages only
- **EOL support** - Includes End-of-Life distributions with corrected repositories

## Important Note

⚠️ **These images are designed for testing roles and playbooks using Ansible Molecule in isolated environments — not for production use.** The settings and configuration may not be suitable for secure and performant production environments.

## Quick Start

1. **Install requirements:**
   ```bash
   pip install molecule[containers]
   ansible-galaxy collection install containers.podman
   ```

2. **Use in molecule.yml:**
   ```yaml
   driver:
     name: containers
   platforms:
   - name: ubuntu-test
     image: mpaivabarbosa/molecule-systemd-ubuntu:24.04
     privileged: true
     volumes:
       - /sys/fs/cgroup:/sys/fs/cgroup:ro
   ```

3. **Run tests:**
   ```bash
   molecule test
   ```

## Project Structure

```
molecule-systemd-images/
├── images/
│   ├── rhel-family/     # RHEL-based distributions
│   │   ├── amazonlinux/
│   │   ├── centos/
│   │   ├── rockylinux/
│   │   └── almalinux/
│   ├── debian-family/   # Debian-based distributions
│   │   ├── debian/
│   │   └── ubuntu/
│   └── fedora/          # Fedora releases
├── templates/           # Dockerfile templates
├── scripts/             # Build and test scripts
├── docs/               # Documentation
├── tests/              # Test suites
└── examples/           # Usage examples
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

MIT License - see LICENSE file for details.