# Changelog

All notable changes to this project will be documented in this file.

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

**Total Images**: 34 across 6 distributions  
**Supported Versions**: 25+ different OS versions  
**Compatibility**: Molecule v6+, Podman 4.0+, Ansible 2.9+