# Changelog

All notable changes to this project will be documented in this file.

## [2.5.0] - 2026-09-04

### Added
- **New OS Versions**:
  - Ubuntu 26.04 LTS Resolute (new LTS, support until 2031)
  - openSUSE Leap 16.0 (new major release, support until 2031)
  - Rocky Linux 10 (matches AlmaLinux and Oracle Linux 10 already supported)
- **Image Count Increase**:
  - Total images: 42 (was 39)

### Changed
- **Latest Tags Updated**:
  - `ubuntu:latest` → 26.04 (was 24.04)
  - `opensuse:latest` → 16.0 (was 15.6)
  - `rockylinux:latest` → 10 (was 9)
- **GitHub Actions**:
  - Matrix updated to build 42 images across all distributions
  - `fail-fast: false` added so one distribution failing does not cancel the rest of a scheduled run
- **Makefile**: Added new version targets and updated latest tag pointers for ubuntu, opensuse and rockylinux
- **Documentation**: README.md and family READMEs updated to reflect the new versions and image count

### Added
- **CI**: a smoke test step now runs after every image build and before it is pushed. It boots the container, waits for `systemctl is-system-running` to report `running` or `degraded`, and checks passwordless sudo for the `ansible` user; a failure blocks the push
- **CI**: a Trivy vulnerability scan (HIGH/CRITICAL, report only, does not fail the build) runs on every built image
- **scripts/build-all.sh**: now also builds openSUSE Leap and Arch Linux, which it previously skipped entirely, and Oracle Linux, which was missing from its RHEL family loop

### Fixed
- **Arch Linux Dockerfile**: corrected a sudoers `%wheel` rule corruption bug (the uncomment sed matched both template lines in the default sudoers file, and the following sed then produced invalid syntax, breaking sudo); the image now also refreshes `archlinux-keyring` before `pacman -Syu` and validates the sudoers file with `visudo -c` at build time
- **scripts/build-all.sh**: fixed `set -e` combined with `((total++))` causing the script to exit immediately on the very first counter increment (an arithmetic expression that evaluates to `0` returns a false exit status), so the script never actually built anything; counters now use `total=$((total + 1))`
- **Molecule install instructions**: `pip install molecule[containers]` no longer works since current Molecule (26.x) ships with no extras; replaced with `pip install molecule molecule-plugins[podman]` everywhere, and added the `community.docker` and `ansible.posix` collections the containers driver actually requires alongside `containers.podman`
- **examples/molecule.yml**: added the missing `examples/requirements.yml` it has referenced since it was written
- **molecule.yml examples**: removed `cgroupns_mode`, an invalid platform key for the containers driver (`additionalProperties: false` in its schema); copying these examples as documented would fail schema validation
- **README.md**: fixed a troubleshooting example that misused `dockerfile:` with inline Dockerfile content instead of a path to a `Dockerfile.j2` template

### Changed
- **Documentation**: flagged Amazon Linux 2 as EOL (since 2026-06-30) in its family README and in the main README, matching the existing CentOS EOL notice

### Technical Details
- Rocky Linux 10's Dockerfile pulls `rockylinux/rockylinux:10`, not `rockylinux:10`. The official `docker.io/library/rockylinux` image does not publish a `10` tag, only Rocky's own Docker Hub namespace does
- openSUSE Leap 16.0 ships its default sudo policy under `/usr/etc/sudoers` instead of `/etc/sudoers`; the existing `/etc/sudoers.d` based ansible user setup already works with this layout without changes

## [2.4.0] - 2026-01-05

### Added
- **New Distribution Family: Arch Linux**
  - Arch Linux (rolling release) - Always up-to-date
- **Distribution Family Expansion**:
  - Arch Linux family added (rolling release distribution)
  - 9 distribution families now supported (was 8)
- **Image Count Increase**:
  - Total images: 39 (was 38)
  - New image: Arch Linux latest (rolling)

### Changed
- **Latest Tags Updated**:
  - `archlinux:latest` (new, rolling release)
- **GitHub Actions**: 
  - Matrix updated to build 39 images across all distributions
  - Added Docker Hub description auto-update for Arch Linux
- **Makefile**: 
  - Added Arch Linux build target
  - Updated supported distributions list
  - Added archlinux to build target
- **Documentation**:
  - README.md: Updated to reflect 39 images across 9 families
  - Added Arch Linux README with usage examples
  - Updated main README with Arch Linux section
  - Updated distribution comparison table

### Technical Details
- Arch Linux uses pacman package manager
- Rolling release model - always latest packages
- systemd enabled and configured
- Python 3.12+ and pip pre-installed
- ansible user with passwordless sudo access (wheel group)
- Compatible with Molecule testing framework
- Best for testing with bleeding-edge software versions

## [2.3.0] - 2026-01-05

### Added
- **New Distribution Family: openSUSE Leap**
  - openSUSE Leap 15.6 (latest) - Support until December 2025
  - openSUSE Leap 15.5 - Support until December 2024
  - openSUSE Leap 15.4 - Support until December 2023
- **Distribution Family Expansion**:
  - openSUSE family added (SUSE-based distributions)
  - 8 distribution families now supported (was 7)
- **Image Count Increase**:
  - Total images: 38 (was 35)
  - New images: openSUSE Leap 15.4, 15.5, 15.6

### Changed
- **Latest Tags Updated**:
  - `opensuse:latest` → 15.6 (new)
- **GitHub Actions**: Matrix updated to build 38 images across all distributions
- **Makefile**: 
  - Added openSUSE Leap build targets
  - Updated supported distributions list
  - Added opensuse to build target
- **Documentation**:
  - README.md: Updated to reflect 38 images across 8 families
  - Added openSUSE README with usage examples
  - Updated main README with openSUSE section

### Technical Details
- openSUSE images use zypper package manager
- systemd enabled and configured
- Python 3 and pip pre-installed
- ansible user with passwordless sudo access
- Compatible with Molecule testing framework

## [2.2.1] - 2025-12-29

### Removed
- **Ubuntu 24.10 (Oracular Oriole)**: Removed due to EOL (End of Life)
  - Ubuntu 24.10 reached EOL in July 2025 (9 months support for non-LTS)
  - Repositories no longer available, causing build failures
  
### Changed
- **Image Count**: Reduced from 36 to 35 images
- **GitHub Actions**: Matrix updated to build 35 images
- **Documentation**: Removed Ubuntu 24.10 references from all READMEs

### Fixed
- Build workflow failures caused by Ubuntu 24.10 unavailable repositories

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