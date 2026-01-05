# Fedora Images

![Docker Pulls](https://img.shields.io/docker/pulls/mpaivabarbosa/molecule-systemd-fedora?logo=docker&label=pulls)
![Docker Image Size](https://img.shields.io/docker/image-size/mpaivabarbosa/molecule-systemd-fedora/latest?logo=docker&label=size)
![Fedora](https://img.shields.io/badge/fedora-44-blue?logo=fedora)
![Systemd](https://img.shields.io/badge/systemd-enabled-green?logo=systemd)

Container images for testing Ansible roles with Molecule using Fedora distributions.

**Repository:** https://github.com/marciopaiva/molecule-systemd-images

## Available Tags

**Current Releases:**
- `latest`, `44` - Fedora 44 (recommended)
- `43` - Fedora 43
- `42` - Fedora 42
- `41` - Fedora 41
- `40` - Fedora 40
- `39` - Fedora 39
- `38` - Fedora 38
- `37` - Fedora 37
- `36` - Fedora 36

**Legacy/EOL Releases:**
- `32` - Fedora 32 (EOL)
- `31` - Fedora 31 (EOL)

## Why Fedora?

- ✅ **Cutting Edge** - Latest software packages and kernel
- ✅ **Upstream First** - Features land here before RHEL
- ✅ **Fast Release Cycle** - New version every ~6 months
- ✅ **SELinux Enforcing** - Security-enhanced by default
- ✅ **Innovation Hub** - Testing ground for Red Hat technologies

## Use Cases

- Testing with the latest software versions
- Development and early feature testing
- Validating compatibility with upcoming RHEL features
- Modern toolchain and library testing
- CI/CD for forward-compatibility

## Usage

```yaml
platforms:
  - name: fedora-44
    image: mpaivabarbosa/molecule-systemd-fedora:44
    volumes:
      - /sys/fs/cgroup:/sys/fs/cgroup:ro
    privileged: true
    pre_build_image: true
```

## Features

- Systemd enabled (latest version)
- Python 3.14 (Fedora 44) / 3.13 (Fedora 43)
- DNF package manager
- Ansible user with sudo privileges
- Optimized for Molecule testing
- SELinux available (permissive in containers)

## Common Issues

**Issue: DNF is slow**
```bash
# Use faster mirrors
RUN echo "fastestmirror=1" >> /etc/dnf/dnf.conf
```

**Issue: Package not found**
```bash
# Enable additional repositories
RUN dnf install -y fedora-repos-rawhide
```

## Links

- [Fedora Official](https://getfedora.org/)
- [Fedora Docs](https://docs.fedoraproject.org/)
- [Fedora Packages](https://packages.fedoraproject.org/)
- [Fedora Magazine](https://fedoramagazine.org/)

## Important Note

⚠️ **These images are designed for testing purposes only and should NOT be used in production environments.** The configuration is optimized for Molecule testing scenarios and may not be suitable for secure production deployments.