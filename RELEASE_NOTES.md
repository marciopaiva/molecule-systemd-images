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