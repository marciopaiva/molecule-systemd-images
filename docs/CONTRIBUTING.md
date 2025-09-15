# Contributing to Molecule Systemd Images

Thank you for your interest in contributing! This document provides guidelines for contributing to the project.

## 🚀 Quick Start

1. **Fork the repository**
2. **Clone your fork**
3. **Create a feature branch**
4. **Make your changes**
5. **Test locally**
6. **Submit a pull request**

## 📁 Project Structure

```
molecule-systemd-images/
├── images/
│   ├── rhel-family/     # RHEL-based distributions
│   ├── debian-family/   # Debian-based distributions
│   └── fedora/          # Fedora images
├── templates/           # Dockerfile templates
├── scripts/             # Utility scripts
├── docs/               # Documentation
└── tests/              # Test suites
```

## 🐳 Adding New Images

### 1. Choose the Right Family

- **RHEL family**: Amazon Linux, CentOS, Rocky Linux, AlmaLinux
- **Debian family**: Debian, Ubuntu
- **Fedora**: Fedora releases

### 2. Create Directory Structure

```bash
# For RHEL family
mkdir -p images/rhel-family/{os}/{version}

# For Debian family  
mkdir -p images/debian-family/{os}/{version}

# For Fedora
mkdir -p images/fedora/{version}
```

### 3. Create Dockerfile

Use existing Dockerfiles as templates. Ensure:
- Systemd support
- Ansible user with sudo privileges
- Essential packages installed
- Proper EOL repository handling

### 4. Update Build Matrix

Add new versions to `.github/workflows/build.yml`:

```yaml
- os: newos
  version: "1.0"
```

### 5. Test Locally

```bash
# Build specific image
./scripts/build-all.sh

# Test specific image
./scripts/test-image.sh newos 1.0
```

## 🧪 Testing Guidelines

### Local Testing

```bash
# Build all images
make build

# Test specific image
make test IMAGE=ubuntu:24.04

# Run integration tests
./scripts/test-image.sh ubuntu 24.04
```

### Required Tests

All images must pass:
- ✅ Basic container run
- ✅ Systemd availability
- ✅ Python 3 installation
- ✅ Ansible user creation
- ✅ Sudo privileges

## 📝 Documentation Standards

### README Updates

When adding new distributions:
1. Update supported images list
2. Add Docker Hub links
3. Update version counts
4. Include usage examples

### Commit Messages

Use conventional commits:
```
feat: add Rocky Linux 9 support
fix: correct CentOS 8 repository URLs
docs: update contributing guidelines
```

## 🔧 Development Workflow

### 1. Local Development

```bash
# Clone repository
git clone https://github.com/marciopaiva/molecule-systemd-images.git
cd molecule-systemd-images

# Create feature branch
git checkout -b feature/add-new-os

# Make changes
# ...

# Test changes
./scripts/build-all.sh
./scripts/test-image.sh newos version
```

### 2. Pull Request Process

1. **Ensure all tests pass**
2. **Update documentation**
3. **Add changelog entry**
4. **Request review**

### 3. Review Criteria

- ✅ Builds successfully
- ✅ Passes all tests
- ✅ Documentation updated
- ✅ Follows project conventions
- ✅ No security vulnerabilities

## 🐛 Bug Reports

### Before Reporting

1. Check existing issues
2. Test with latest version
3. Verify it's not a configuration issue

### Bug Report Template

```markdown
**Description**
Brief description of the issue

**Environment**
- OS: [e.g., Ubuntu 24.04]
- Container Engine: [e.g., Podman 4.0]
- Image: [e.g., mpaivabarbosa/molecule-systemd-ubuntu:24.04]

**Steps to Reproduce**
1. Step one
2. Step two
3. Step three

**Expected Behavior**
What should happen

**Actual Behavior**
What actually happens

**Additional Context**
Any other relevant information
```

## 💡 Feature Requests

### Guidelines

- Explain the use case
- Provide implementation suggestions
- Consider backward compatibility
- Discuss maintenance implications

## 📋 Code Style

### Dockerfile Standards

```dockerfile
# Use official base images
FROM ubuntu:24.04

# Group RUN commands
RUN apt-get update && \
    apt-get install -y \
        package1 \
        package2 && \
    apt-get clean

# Clear package caches
RUN rm -rf /var/lib/apt/lists/*
```

### Shell Script Standards

```bash
#!/bin/bash
set -e  # Exit on error

# Use meaningful variable names
CONTAINER_ENGINE="${CONTAINER_ENGINE:-podman}"

# Add error handling
if ! command -v "${CONTAINER_ENGINE}" &> /dev/null; then
    echo "Error: ${CONTAINER_ENGINE} not found"
    exit 1
fi
```

## 🔒 Security Guidelines

- Never include credentials in code
- Use official base images only
- Keep packages updated
- Follow least privilege principle
- Scan for vulnerabilities

## 📞 Getting Help

- **Issues**: GitHub Issues for bugs and features
- **Discussions**: GitHub Discussions for questions
- **Security**: See SECURITY.md for security issues

## 📄 License

By contributing, you agree that your contributions will be licensed under the MIT License.