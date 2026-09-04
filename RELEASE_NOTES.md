# Release v2.5.0 - Ubuntu 26.04, openSUSE Leap 16.0 and Rocky Linux 10

## 🎉 New Version Additions

### 🟠 **Ubuntu 26.04 LTS**
- Latest Ubuntu LTS release (Resolute Raccoon), support until 2031
- Becomes the new `ubuntu:latest`

### 🦎 **openSUSE Leap 16.0**
- New major Leap generation, support until 2031
- Becomes the new `opensuse:latest`

### 🔷 **Rocky Linux 10**
- Matches AlmaLinux and Oracle Linux, which already offer version 10
- Becomes the new `rockylinux:latest`

## 📦 **Updated Image Count**

**42 container images** across **9 distributions** (was 39):

### **RHEL Family (15 images)**
- **Amazon Linux**: 2, 2023 (latest)
- **CentOS**: 7, 8 (EOL - legacy support)
- **Rocky Linux**: 8, 9, 10 (latest) ✨ **NEW VERSION**
- **AlmaLinux**: 8, 9, 10 (latest)
- **Oracle Linux**: 8, 9, 10 (latest)

### **Debian Family (13 images)**
- **Debian**: 9, 10, 11, 12, 13 (latest)
- **Ubuntu**: 18.04, 19.10, 20.04, 21.04, 22.04, 23.04, 24.04, 26.04 (latest) ✨ **NEW VERSION**

### **Fedora (11 images)**
- **Fedora**: 31, 32, 36, 37, 38, 39, 40, 41, 42, 43, 44 (latest)

### **SUSE Family (4 images)**
- **openSUSE Leap**: 15.4, 15.5, 15.6, 16.0 (latest) ✨ **NEW VERSION**

### **Arch Linux (1 image)**
- **Arch Linux**: latest (rolling release)

## ✨ **What's Changed**

### 🏷️ **Latest Tag Updates**
- `ubuntu:latest` → now points to version 26.04 (was 24.04)
- `opensuse:latest` → now points to version 16.0 (was 15.6)
- `rockylinux:latest` → now points to version 10 (was 9)

### 🔧 **Build System**
- **Makefile**: Added ubuntu:26.04, opensuse:16.0 and rockylinux:10 targets; updated latest tag pointers
- **GitHub Actions**: Matrix expanded to build all 42 images; added `fail-fast: false` so one distribution failing does not cancel the rest of a scheduled run

### 📚 **Documentation**
- Updated Ubuntu, openSUSE and Rocky Linux READMEs with the new versions
- Main README updated to reflect 42 total images
- All badges and shields updated

## 🚀 **Usage Examples**

### Using Ubuntu 26.04 LTS
```yaml
platforms:
  - name: ubuntu-26
    image: docker.io/mpaivabarbosa/molecule-systemd-ubuntu:26.04
    pre_build_image: true
    privileged: true
    command: /lib/systemd/systemd
    volumes:
      - /sys/fs/cgroup:/sys/fs/cgroup:ro
```

### Using openSUSE Leap 16.0
```yaml
platforms:
  - name: opensuse-leap-16-0
    image: docker.io/mpaivabarbosa/molecule-systemd-opensuse:16.0
    pre_build_image: true
    privileged: true
    command: /usr/lib/systemd/systemd
    volumes:
      - /sys/fs/cgroup:/sys/fs/cgroup:rw
    cgroupns_mode: host
```

### Using Rocky Linux 10
```yaml
platforms:
  - name: rockylinux-10
    image: docker.io/mpaivabarbosa/molecule-systemd-rockylinux:10
    pre_build_image: true
    privileged: true
    command: /usr/sbin/init
    volumes:
      - /sys/fs/cgroup:/sys/fs/cgroup:ro
```

## 🐛 **Bug Fix (Arch Linux)**

- Corrected a sudoers `%wheel` rule corruption bug in the Arch Linux image: the uncomment sed was matching both template lines in the default sudoers file, and the following sed then produced invalid syntax, breaking sudo for every user
- `archlinux-keyring` is now refreshed before `pacman -Syu` to avoid intermittent PGP signature failures on rebuilds
- The sudoers file is now validated with `visudo -c` at build time
- GitHub Actions matrix now uses `fail-fast: false` so an Arch Linux build failure does not cancel the other 41 image builds in the same run

## ⚙️ **Technical Notes**

- Rocky Linux 10's Dockerfile pulls `rockylinux/rockylinux:10`, not `rockylinux:10` — the official `docker.io/library/rockylinux` image does not publish a `10` tag yet, only Rocky's own Docker Hub namespace does
- openSUSE Leap 16.0 ships its default sudo policy under `/usr/etc/sudoers` instead of `/etc/sudoers`; the existing `/etc/sudoers.d` based ansible user setup already works correctly with this layout

---

# Release v2.4.0 - Arch Linux Support

## 🎉 New Distribution Family

### 🐧 **Arch Linux (Rolling Release)**
- **Arch Linux latest**: Rolling release with bleeding-edge packages
- Always up-to-date with the latest software versions
- Perfect for testing with cutting-edge tools and libraries

## 📦 **Updated Image Count**

**39 container images** across **9 distributions** (was 38 across 8):

### **RHEL Family (14 images)**
- **Amazon Linux**: 2, 2023 (latest)
- **CentOS**: 7, 8 (EOL - legacy support)
- **Rocky Linux**: 8, 9 (latest)
- **AlmaLinux**: 8, 9, 10 (latest)
- **Oracle Linux**: 8, 9, 10 (latest)

### **Debian Family (12 images)**
- **Debian**: 9, 10, 11, 12, 13 (latest)
- **Ubuntu**: 18.04, 19.10, 20.04, 21.04, 22.04, 23.04, 24.04 (latest)

### **Fedora (11 images)**
- **Fedora**: 31, 32, 36, 37, 38, 39, 40, 41, 42, 43, 44 (latest)

### **SUSE Family (3 images)**
- **openSUSE Leap**: 15.4, 15.5, 15.6 (latest)

### **Arch Linux (1 image)** ✨ **NEW**
- **Arch Linux**: latest (rolling release)

## ✨ **What's Changed**

### 🏷️ **Latest Tag Updates**
- `archlinux:latest` → Rolling release (new)

### 🔧 **Build System**
- **Makefile**: New `archlinux` target added
- **GitHub Actions**: Matrix expanded to build all 39 images
- **CI/CD**: Automated builds for Arch Linux
- **Docker Hub**: Auto-update descriptions on successful builds

### 📚 **Documentation**
- Added Arch Linux README with usage examples
- Main README updated with 9 distribution families
- Distribution comparison table includes Arch Linux
- All badges and shields updated

## 🚀 **Usage Examples**

### Using Arch Linux (Rolling Release)
```yaml
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

## 🔍 **Why Arch Linux?**

- ✅ **Bleeding Edge** - Latest software versions, cutting-edge packages
- ✅ **Rolling Release** - Continuous updates, no version upgrades needed
- ✅ **Pacman** - Fast, powerful package manager
- ✅ **AUR Support** - Largest community-maintained package repository
- ✅ **Lightweight** - Minimal base, install only what you need
- ✅ **Development** - Perfect for testing with latest tools

## ⚠️ **Important Notes**

**Rolling Release Considerations:**
- Images are rebuilt regularly to stay current
- Breaking changes may occur without version bumps
- Test roles frequently (weekly recommended)
- Consider pinning specific package versions for critical dependencies
- Monitor [Arch Linux News](https://archlinux.org/news/) for breaking changes

## 📋 **Package Management**

```bash
# Update system
pacman -Syu

# Install packages
pacman -S package_name

# Search packages
pacman -Ss keyword
```

---

# Release v2.3.0 - openSUSE Leap Support

## 🎉 New Distribution Family

### 🦎 **openSUSE Leap**
- **openSUSE Leap 15.6**: Latest stable release (until December 2025)
- **openSUSE Leap 15.5**: Previous stable (until December 2024)
- **openSUSE Leap 15.4**: Legacy support (until December 2023)

## 📦 **Updated Image Count**

**38 container images** across **8 distributions** (was 35 across 7):

### **RHEL Family (14 images)**
- **Amazon Linux**: 2, 2023 (latest)
- **CentOS**: 7, 8 (EOL - legacy support)
- **Rocky Linux**: 8, 9 (latest)
- **AlmaLinux**: 8, 9, 10 (latest)
- **Oracle Linux**: 8, 9, 10 (latest)

### **Debian Family (12 images)**
- **Debian**: 9, 10, 11, 12, 13 (latest)
- **Ubuntu**: 18.04, 19.10, 20.04, 21.04, 22.04, 23.04, 24.04 (latest)

### **Fedora (11 images)**
- **Fedora**: 31, 32, 36, 37, 38, 39, 40, 41, 42, 43, 44 (latest)

### **SUSE Family (3 images)** ✨ **NEW**
- **openSUSE Leap**: 15.4, 15.5, 15.6 (latest)

## ✨ **What's Changed**

### 🏷️ **Latest Tag Updates**
- `opensuse:latest` → now points to version 15.6 (new)

### 🔧 **Build System**
- **Makefile**: New `opensuse` target added
- **GitHub Actions**: Matrix expanded to build all 38 images
- **CI/CD**: Automated builds for openSUSE Leap

### 📚 **Documentation**
- Added openSUSE Leap README with usage examples
- Main README updated with 8 distribution families
- All badges and shields updated

## 🚀 **Usage Examples**

### Using openSUSE Leap 15.6
```yaml
platforms:
  - name: opensuse-leap-15-6
    image: docker.io/mpaivabarbosa/molecule-systemd-opensuse:15.6
    pre_build_image: true
    privileged: true
    command: /usr/lib/systemd/systemd
    volumes:
      - /sys/fs/cgroup:/sys/fs/cgroup:rw
    cgroupns_mode: host
```

### Using openSUSE Leap (latest)
```yaml
platforms:
  - name: opensuse-latest
    image: docker.io/mpaivabarbosa/molecule-systemd-opensuse:latest
    pre_build_image: true
    privileged: true
    command: /usr/lib/systemd/systemd
    volumes:
      - /sys/fs/cgroup:/sys/fs/cgroup:rw
    cgroupns_mode: host
```

## 🔄 **Distribution Coverage**

Now supporting all 3 major Linux distribution families:
- ✅ **RHEL-based**: Amazon Linux, CentOS, Rocky, AlmaLinux, Oracle Linux
- ✅ **Debian-based**: Debian, Ubuntu
- ✅ **SUSE-based**: openSUSE Leap
- ✅ **Independent**: Fedora

## 📊 **Why openSUSE Leap?**

- **Enterprise Ready**: Based on SUSE Linux Enterprise (SLE)
- **Stability**: 18-month support cycle per version
- **systemd Native**: Full systemd support out of the box
- **Professional Use**: Widely used in corporate environments
- **Package Manager**: zypper (RPM-based, like RHEL/Fedora)

---

# Release v2.2.1 - Ubuntu 24.10 Removal (EOL)

## ⚠️ Breaking Change

### 🗑️ **Ubuntu 24.10 Removed**
- **Reason**: Ubuntu 24.10 (Oracular Oriole) reached End of Life in July 2025
- **Impact**: Repositories no longer available, causing build failures
- **Alternative**: Use Ubuntu 24.04 LTS (supported until 2029)

## 📦 **Updated Image Count**

**35 container images** across **7 distributions** (was 36):

### **Debian Family (12 images)** - *Reduced*
- **Debian**: 9, 10, 11, 12, 13 (latest)
- **Ubuntu**: 18.04, 19.10, 20.04, 21.04, 22.04, 23.04, 24.04 (latest)

### **Fedora (11 images)**
- **Fedora**: 31, 32, 36, 37, 38, 39, 40, 41, 42, 43, 44 (latest)

### **RHEL Family (14 images)**
- **Amazon Linux**: 2, 2023 (latest)
- **CentOS**: 7, 8 (EOL - legacy support)
- **Rocky Linux**: 8, 9 (latest)
- **AlmaLinux**: 8, 9, 10 (latest)
- **Oracle Linux**: 8, 9, 10 (latest)

## 🐛 **Bug Fix**

- Fixed GitHub Actions workflow failures caused by Ubuntu 24.10 EOL
- All 35 remaining images now build successfully

## 📝 **Migration Guide**

If you were using Ubuntu 24.10, update your `molecule.yml`:

```yaml
# Before (will fail)
platforms:
  - name: ubuntu2410
    image: docker.io/mpaivabarbosa/molecule-systemd-ubuntu:24.10

# After (recommended)
platforms:
  - name: ubuntu2404
    image: docker.io/mpaivabarbosa/molecule-systemd-ubuntu:24.04
```

---

# Release v2.2.0 - Fedora and Ubuntu Updates

## 🎉 New Version Additions

### 🔵 **Fedora Updates**
- **Fedora 43**: Latest stable release
- **Fedora 44**: Rawhide/Development version

### 🟠 **Ubuntu Update**
- **Ubuntu 24.10 (Oracular Oriole)**: Latest interim release

## 📦 **Updated Image Count**

**36 container images** across **7 distributions** (was 33):

### **RHEL Family (14 images)**
- **Amazon Linux**: 2, 2023 (latest)
- **CentOS**: 7, 8 (EOL - legacy support)
- **Rocky Linux**: 8, 9 (latest)
- **AlmaLinux**: 8, 9, 10 (latest)
- **Oracle Linux**: 8, 9, 10 (latest)

### **Debian Family (13 images)** - *Expanded!*
- **Debian**: 9, 10, 11, 12, 13 (latest)
- **Ubuntu**: 18.04, 19.10, 20.04, 21.04, 22.04, 23.04, 24.04, 24.10 (latest) ✨ **NEW VERSION**

### **Fedora (11 images)** - *Expanded!*
- **Fedora**: 31, 32, 36, 37, 38, 39, 40, 41, 42, 43, 44 (latest) ✨ **NEW VERSIONS**

## ✨ **What's Changed**

### 🏷️ **Latest Tag Updates**
- `fedora:latest` → now points to version 44 (was 42)
- `ubuntu:latest` → remains at 24.04 LTS

### 🔧 **Build System**
- **Makefile**: Added fedora:43, fedora:44, ubuntu:24.10 targets
- **GitHub Actions**: Matrix expanded to build all 36 images
- **CI/CD**: Automated builds for new versions

### 📚 **Documentation**
- Updated Fedora README with versions 43 and 44
- Updated Ubuntu README with version 24.10
- Main README updated to reflect 36 total images

## 🚀 **Usage Examples**

### Using Fedora 44 (Latest/Rawhide)
```yaml
platforms:
  - name: fedora44
    image: docker.io/mpaivabarbosa/molecule-systemd-fedora:44
    pre_build_image: true
    privileged: true
    command: /usr/sbin/init
    volumes:
      - /sys/fs/cgroup:/sys/fs/cgroup:rw
    cgroupns_mode: host
```

### Using Ubuntu 24.10
```yaml
platforms:
  - name: ubuntu2410
    image: docker.io/mpaivabarbosa/molecule-systemd-ubuntu:24.10
    pre_build_image: true
    privileged: true
    command: /usr/lib/systemd/systemd
    volumes:
      - /sys/fs/cgroup:/sys/fs/cgroup:rw
    cgroupns_mode: host
```

## 🔄 **Version Support**

| Distribution | Versions Available | Latest Tag | Status |
|--------------|-------------------|------------|--------|
| Fedora | 31, 32, 36-44 | 44 | ✅ Active |
| Ubuntu | 18.04-24.10 | 24.04 LTS | ✅ Active |

---

# Release v2.1.0 - New Distribution Support

## 🎉 New Distributions Added

### 🐧 **Oracle Linux Support**
- **Oracle Linux 8**: Enterprise-grade RHEL-compatible distribution
- **Oracle Linux 9**: Latest stable version with extended support
- **Oracle Linux 10**: Latest release with modern tooling

### 🔷 **AlmaLinux 10**
- **AlmaLinux 10 (Heliotrope Lion)**: Latest stable release
- Support until 2035-06-01
- Python 3.12 included

## 📦 **Updated Image Count**

**33 container images** across **7 distributions** (was 29 across 6):

### **RHEL Family (14 images)** - *Expanded!*
- **Amazon Linux**: 2, 2023 (latest)
- **CentOS**: 7, 8 (EOL - legacy support)
- **Rocky Linux**: 8, 9 (latest)
- **AlmaLinux**: 8, 9, 10 (latest) ✨ **NEW VERSION**
- **Oracle Linux**: 8, 9, 10 (latest) ✨ **NEW DISTRIBUTION**

### **Debian Family (11 images)**
- **Debian**: 9, 10, 11, 12, 13 (latest)
- **Ubuntu**: 18.04, 19.10, 20.04, 21.04, 22.04, 23.04, 24.04 (latest)

### **Fedora (9 images)**
- **Fedora**: 31, 32, 36, 37, 38, 39, 40, 41, 42 (latest)

## ✨ **What's Changed**

### 🏷️ **Latest Tag Updates**
- `almalinux:latest` → now points to version 10 (was 9)
- `oraclelinux:latest` → now points to version 10 (new)

### 🔧 **Build System**
- **Makefile**: New `oraclelinux` target added
- **GitHub Actions**: Matrix expanded to build all 33 images
- **CI/CD**: Automated builds for new distributions

### 📚 **Documentation**
- Added Oracle Linux README with usage examples
- Updated AlmaLinux README with version 10
- Main README updated with 7 distribution families
- All badges and shields updated

## 🚀 **Usage Examples**

### **Oracle Linux**
```yaml
platforms:
  - name: oraclelinux-10
    image: mpaivabarbosa/molecule-systemd-oraclelinux:10
    volumes:
      - /sys/fs/cgroup:/sys/fs/cgroup:ro
    privileged: true
    pre_build_image: true
```

### **AlmaLinux 10**
```yaml
platforms:
  - name: almalinux-10
    image: mpaivabarbosa/molecule-systemd-almalinux:10
    volumes:
      - /sys/fs/cgroup:/sys/fs/cgroup:ro
    privileged: true
    pre_build_image: true
```

## 🐛 **Issues Resolved**

- **Issue #3**: Added Oracle Linux 8, 9 and 10 support
- **Issue #4**: Added AlmaLinux 10 support

## 📋 **Build Commands**

```bash
# Build all new images
make almalinux    # Builds AlmaLinux 8, 9, 10
make oraclelinux  # Builds Oracle Linux 8, 9, 10

# Build everything
make build
```

## 🔄 **Migration from v2.0.x**

No breaking changes. New distributions are additive:
- Existing images remain unchanged
- AlmaLinux users: version 10 now available
- Oracle Linux users: new distribution family available

---

# Release v2.0.0 - Major Restructure & Docker Hub Migration

## 🎉 Major Changes

### 📁 **New Project Structure**
- **Organized by OS families**: `images/rhel-family/`, `images/debian-family/`, `images/fedora/`
- **Comprehensive documentation**: Added `docs/` with CONTRIBUTING, SECURITY, and TROUBLESHOOTING guides
- **Utility scripts**: New `scripts/` directory with build and test automation
- **Test framework**: Added `tests/` with integration tests and Molecule configurations
- **Reusable templates**: Created `templates/` for Dockerfile standardization

### 🐳 **Registry Migration**
- **Migrated from Quay.io to Docker Hub** for better accessibility
- **New image URLs**: `mpaivabarbosa/molecule-systemd-{os}:{version}`
- **Automated publishing**: GitHub Actions now publishes to Docker Hub

### 🔧 **Build System Improvements**
- **Simplified Makefile**: Removed redundant targets, optimized builds
- **Smart build scripts**: `build-all.sh` with colored output and error handling
- **Individual testing**: `test-image.sh` for comprehensive image validation
- **GitHub Actions**: Updated for new structure with 25 image matrix

## 📦 **Supported Images (25 total)**

### **RHEL Family (8 images)**
- **Amazon Linux**: 2, 2023 (latest)
- **CentOS**: 7, 8 (EOL - legacy support)
- **Rocky Linux**: 8, 9 (latest)
- **AlmaLinux**: 8, 9 (latest)

### **Debian Family (11 images)**
- **Debian**: 9, 10, 11, 12 (latest)
- **Ubuntu**: 18.04, 19.10, 20.04, 21.04, 22.04, 23.04, 24.04 (latest)

### **Fedora (7 images)**
- **Fedora**: 31, 32, 36, 37, 38, 39, 40 (latest)

## ✨ **New Features**

### 🧪 **Testing Framework**
- **Python integration tests**: Automated validation of all images
- **Shell test scripts**: Quick individual image testing
- **Molecule configuration**: Ready-to-use test setup

### 📚 **Documentation**
- **Contributing guide**: Detailed development workflow
- **Security policy**: Vulnerability reporting and best practices
- **Troubleshooting guide**: Common issues and solutions
- **Usage examples**: Complete Molecule configurations

### 🔧 **Developer Tools**
- **Build automation**: Single command to build all images
- **Version management**: Scripts for updating project metadata
- **Template system**: Standardized Dockerfile patterns

## 🚀 **Usage**

### **Quick Start**
```bash
# Install requirements
pip install molecule[containers]
ansible-galaxy collection install containers.podman

# Use in molecule.yml
platforms:
  - name: ubuntu-test
    image: mpaivabarbosa/molecule-systemd-ubuntu:24.04
    privileged: true
    volumes:
      - /sys/fs/cgroup:/sys/fs/cgroup:ro
```

### **Local Development**
```bash
# Build all images
./scripts/build-all.sh

# Test specific image
./scripts/test-image.sh ubuntu 24.04

# Run integration tests
python3 tests/integration/test_basic.py mpaivabarbosa/molecule-systemd-ubuntu:24.04
```

## 🔄 **Migration Guide**

### **From v1.x to v2.0**
1. **Update image URLs**: Change from `quay.io/mpaivabarbosa/` to `mpaivabarbosa/`
2. **Review versions**: Some intermediate versions added (Fedora 36-38, Ubuntu 21.04/23.04)
3. **Update documentation**: New structure and examples available

### **Registry Migration**
- **Old**: `quay.io/mpaivabarbosa/molecule-systemd-ubuntu:24.04`
- **New**: `mpaivabarbosa/molecule-systemd-ubuntu:24.04`

## 🛠️ **Technical Improvements**

### **Build Optimization**
- **Eliminated duplicate builds**: Each image built once, tagged separately
- **Improved caching**: Better layer reuse across builds
- **Faster CI/CD**: Optimized GitHub Actions workflow

### **Code Quality**
- **Standardized Dockerfiles**: Consistent package installation patterns
- **EOL repository handling**: Proper archive URLs for end-of-life distributions
- **Security hardening**: Non-root ansible user with sudo privileges

## 📊 **Statistics**
- **25 container images** across **6 distributions**
- **3 utility scripts** for automation
- **3 documentation guides** for developers
- **2 test frameworks** for validation
- **100% automated** build and publish pipeline

## 🔒 **Security**
- **No hardcoded credentials**: Clean, secure image builds
- **Minimal attack surface**: Only essential packages installed
- **Regular updates**: Weekly automated builds via GitHub Actions
- **Vulnerability scanning**: Integrated security checks

## 🙏 **Acknowledgments**
This major release represents a complete restructure focused on:
- **Developer experience**: Better tooling and documentation
- **Maintainability**: Cleaner code structure and automation
- **Accessibility**: Migration to Docker Hub for easier access
- **Reliability**: Comprehensive testing and validation

---

**Full Changelog**: https://github.com/marciopaiva/molecule-systemd-images/compare/v1.0.0...v2.0.0