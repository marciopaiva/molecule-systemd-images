# Troubleshooting Guide

Common issues and solutions for Molecule Systemd Images.

## 🚨 Common Issues

### Build Issues

#### Issue: Package Installation Fails

**Symptoms:**
```
E: Unable to locate package systemd
```

**Solutions:**
```bash
# For EOL distributions, check repository configuration
# Ubuntu EOL - use old-releases.ubuntu.com
# CentOS EOL - use vault.centos.org
# Debian EOL - use archive.debian.org
```

**Example Fix:**
```dockerfile
# Ubuntu 19.10 (EOL)
RUN sed -i 's|archive.ubuntu.com|old-releases.ubuntu.com|g' /etc/apt/sources.list
```

#### Issue: Build Context Too Large

**Symptoms:**
```
Error: build context is too large
```

**Solutions:**
```bash
# Add .dockerignore file
echo "*.log" >> .dockerignore
echo ".git" >> .dockerignore
echo "*.md" >> .dockerignore
```

### Runtime Issues

#### Issue: Systemd Not Starting

**Symptoms:**
```
Failed to connect to bus: No such file or directory
```

**Solutions:**
```yaml
# Ensure privileged mode and cgroup mount
platforms:
  - name: test
    image: mpaivabarbosa/molecule-systemd-ubuntu:24.04
    privileged: true
    volumes:
      - /sys/fs/cgroup:/sys/fs/cgroup:ro
```

#### Issue: Permission Denied for Ansible User

**Symptoms:**
```
ansible is not in the sudoers file
```

**Solutions:**
```bash
# Check if ansible user exists and has sudo privileges
podman run --rm image_name id ansible
podman run --rm image_name sudo -u ansible sudo -n true
```

### Molecule Issues

#### Issue: Container Driver Not Found

**Symptoms:**
```
ERROR: Driver 'containers' not found
```

**Solutions:**
```bash
# Install containers.podman collection
ansible-galaxy collection install containers.podman

# Verify installation
ansible-galaxy collection list | grep containers.podman
```

#### Issue: Image Pull Fails

**Symptoms:**
```
Error: unable to pull image
```

**Solutions:**
```bash
# Check image exists
podman search mpaivabarbosa/molecule-systemd-ubuntu

# Try manual pull
podman pull mpaivabarbosa/molecule-systemd-ubuntu:24.04

# Check registry connectivity
curl -s https://registry-1.docker.io/v2/
```

### Network Issues

#### Issue: DNS Resolution Fails

**Symptoms:**
```
Could not resolve host: archive.ubuntu.com
```

**Solutions:**
```bash
# Check host DNS
nslookup archive.ubuntu.com

# Use alternative DNS in container
podman run --dns=8.8.8.8 image_name
```

#### Issue: Proxy Configuration

**Symptoms:**
```
Connection timed out during package installation
```

**Solutions:**
```dockerfile
# Add proxy configuration to Dockerfile
ENV http_proxy=http://proxy.company.com:8080
ENV https_proxy=http://proxy.company.com:8080
```

## 🔧 Debugging Commands

### Container Inspection

```bash
# Check container status
podman ps -a

# Inspect container
podman inspect container_name

# Check logs
podman logs container_name

# Execute shell in running container
podman exec -it container_name /bin/bash
```

### Image Analysis

```bash
# Check image layers
podman history image_name

# Inspect image
podman inspect image_name

# Check image size
podman images --format "table {{.Repository}}\t{{.Tag}}\t{{.Size}}"
```

### System Information

```bash
# Check Podman version
podman version

# Check system info
podman info

# Check available space
df -h

# Check memory usage
free -h
```

## 🐛 Specific Distribution Issues

### Amazon Linux

#### Issue: Python3 Not Available

**Solution:**
```dockerfile
# Amazon Linux 2
RUN yum install -y python3

# Amazon Linux 2023
RUN dnf install -y python3
```

### CentOS (EOL)

#### Issue: Repository Not Found

**Solution:**
```dockerfile
# CentOS 8 (EOL)
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* && \
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
```

### Debian EOL

#### Issue: Package Version Conflicts

**Solution:**
```dockerfile
# Debian 9/10 (EOL)
RUN apt-get update && \
    apt-get install -y --allow-downgrades \
        systemd=247.3-7+deb11u4 \
        python3 \
        sudo
```

### Ubuntu EOL

#### Issue: Repository Access Denied

**Solution:**
```dockerfile
# Ubuntu 19.10, 21.04, 23.04 (EOL)
RUN sed -i 's|archive.ubuntu.com|old-releases.ubuntu.com|g' /etc/apt/sources.list && \
    sed -i 's|security.ubuntu.com|old-releases.ubuntu.com|g' /etc/apt/sources.list
```

### Fedora

#### Issue: DNF Cache Issues

**Solution:**
```dockerfile
# Clear DNF cache
RUN dnf clean all && \
    dnf makecache
```

## 🔍 Performance Issues

### Slow Builds

**Causes & Solutions:**

1. **Large build context**
   ```bash
   # Add .dockerignore
   echo ".git" >> .dockerignore
   ```

2. **No layer caching**
   ```bash
   # Use build cache
   podman build --cache-from=previous_image
   ```

3. **Network latency**
   ```bash
   # Use local mirror
   # Configure package manager to use local mirrors
   ```

### High Memory Usage

**Solutions:**
```bash
# Limit container memory
podman run --memory=1g image_name

# Check memory usage
podman stats container_name
```

## 📊 Monitoring and Logging

### Enable Debug Logging

```bash
# Podman debug mode
podman --log-level=debug run image_name

# Molecule debug mode
molecule --debug test
```

### Log Analysis

```bash
# Container logs
podman logs --follow container_name

# System logs
journalctl -u podman

# Molecule logs
tail -f ~/.cache/molecule/*/*/molecule.log
```

## 🆘 Getting Help

### Before Asking for Help

1. **Check this troubleshooting guide**
2. **Search existing GitHub issues**
3. **Test with latest image version**
4. **Verify your configuration**

### Information to Include

```bash
# System information
uname -a
podman version
molecule --version

# Configuration
cat molecule/default/molecule.yml

# Error messages
# Include full error output

# Steps to reproduce
# Exact commands that cause the issue
```

### Where to Get Help

- **GitHub Issues**: Bug reports and feature requests
- **GitHub Discussions**: Questions and community help
- **Documentation**: Check README and docs/ folder

## 🔧 Quick Fixes

### Reset Everything

```bash
# Stop all containers
podman stop $(podman ps -aq)

# Remove all containers
podman rm $(podman ps -aq)

# Remove all images
podman rmi $(podman images -q)

# Clean system
podman system prune -af
```

### Verify Installation

```bash
# Test basic functionality
./scripts/test-image.sh ubuntu 24.04

# Test Molecule integration
molecule init role test-role --driver-name containers
cd test-role
molecule test
```

---

**Still having issues?** Open a GitHub issue with detailed information about your problem.