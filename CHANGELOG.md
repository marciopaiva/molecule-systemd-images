# Changelog

All notable changes to this project will be documented in this file.

## [2.2.0] - 2025-12-29

### Added
- **New Fedora Versions**:
  - Fedora 43 - Latest stable release
  - Fedora 44 - Rawhide/Development version
- **New Ubuntu Version**:
  - Ubuntu 24.10 (Oracular Oriole) - Latest interim release
- **Image Count Increase**:
  - Total images: 36 (was 33)
  - New images: Fedora 43/44, Ubuntu 24.10

### Changed
- **Latest Tags Updated**:
  - `fedora:latest` → 44 (was 42)
- **GitHub Actions**: Matrix updated to build 36 images across all distributions
- **Documentation**:
  - README.md: Updated to reflect 36 images
  - Fedora README: Added versions 43 and 44
  - Ubuntu README: Added version 24.10

## [2.1.0] - 2025-12-29

### Added
- **New Distribution Support**:
  - AlmaLinux 10 (Heliotrope Lion) - Latest stable release
  - Oracle Linux 8 - Enterprise-grade RHEL compatible
  - Oracle Linux 9 - Latest stable version
  - Oracle Linux 10 - Latest release
- **Distribution Family Expansion**:
  - Oracle Linux family added to RHEL-compatible distributions
  - 7 distribution families now supported (was 6)
- **Image Count Increase**:
  - Total images: 33 (was 29)
  - New images: AlmaLinux 10, Oracle Linux 8/9/10

### Changed
- **Latest Tags Updated**:
  - `almalinux:latest` → 10 (was 9)
  - `oraclelinux:latest` → 10 (new)
- **GitHub Actions**: Matrix updated to build 33 images across all distributions
- **Makefile**: 
  - Added Oracle Linux build targets
  - Updated supported distributions list
  - Added oraclelinux to build target
- **Documentation**:
  - README.md: Updated to reflect 33 images across 7 families
  - Added Oracle Linux README with badges and examples
  - Updated AlmaLinux README with version 10

### Fixed
- **Issue #3**: Added Oracle Linux 8, 9 and 10 support
- **Issue #4**: Added AlmaLinux 10 support
- **CI/CD Pipeline**: Updated workflow to build new distribution versions

## [2.0.2] - 2025-01-16

### Added
- **New Distribution Versions**:
  - Debian 13 (Trixie) - Latest stable release
  - Fedora 41 - Latest stable version
  - Fedora 42 - Latest release
- **Comprehensive Documentation**:
  - GitHub repository links in all distribution READMEs
  - Docker shields (pulls, size, version, systemd status) for all distributions
  - EOL status badges for legacy distributions
- **Enhanced Visual Appeal**:
  - Main README with comprehensive shields (GitHub, Docker, tech badges)
  - Distribution-specific badges with logos and version info

### Fixed
- **Issue #2**: Added missing `python3-apt` package to Ubuntu and Debian images
- **EOL Repository Handling**: 
  - Ubuntu 21.04 and 23.04 now properly use old-releases.ubuntu.com
  - Added missing repository configuration for EOL versions
- **Registry URLs**: Corrected all references from quay.io to Docker Hub
- **Documentation Consistency**: Updated all version counts and examples

### Changed
- **Latest Tags Updated**:
  - `debian:latest` → 13 (was 12)
  - `fedora:latest` → 42 (was 40)
- **GitHub Actions**: Matrix updated to build 29 images across all new versions
- **Makefile**: Updated build targets for new distributions

## [2.0.1] - 2025-01-16

### Added
- Debian 13, Fedora 41, Fedora 42 support
- python3-apt package fix
- Documentation improvements

## [2.0.0] - 2025-01-16

### Added
- Complete project restructure
- 29 container images across 6 distributions
- GitHub Actions CI/CD pipeline
- Comprehensive documentation

## [Unreleased]

### Added
- **New Fedora versions**: 36, 37, 38, 39 (intermediate versions)
- **New Ubuntu versions**: 19.10, 21.04, 23.04 (intermediate versions)
- **Enhanced Makefile**: Added header, help system, and utility targets
- **Examples directory**: Complete molecule.yml example with documentation
- **TESTING.md**: Local testing guide and setup instructions

### Changed
- **Updated all READMEs**: Standardized format with version organization
- **Improved documentation**: Better structure and production warnings
- **GitHub Actions**: Updated matrix to include all 25 versions
- **Package standardization**: Consistent package sets across all images

### Fixed
- **EOL repositories**: Corrected URLs for End-of-Life distributions
  - CentOS: Using vault.centos.org
  - Debian 9/10: Using archive.debian.org with dependency fixes
  - Ubuntu EOL: Using old-releases.ubuntu.com
- **Dependency conflicts**: Resolved package version conflicts in Debian images
- **Build consistency**: All 34 images now build successfully

### Removed
- **Travis CI**: Removed outdated .travis.yml configuration
- **Rocky/Alma Linux 7**: These versions don't exist (only 8 and 9 available)

## [Previous Versions]

### Features
- Systemd-enabled container images
- Ansible user with sudo privileges
- Molecule v6+ compatibility
- Podman support
- Multi-distribution coverage

---

**Total Images**: 29 across 6 distributions  
**Supported Versions**: 29 different OS versions  
**Compatibility**: Molecule v6+, Podman 4.0+, Ansible 2.9+