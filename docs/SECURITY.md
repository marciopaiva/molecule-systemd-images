# Security Policy

## 🔒 Supported Versions

We provide security updates for the following versions:

| Version | Supported          |
| ------- | ------------------ |
| Latest  | ✅ Yes             |
| Previous| ⚠️ Limited support |
| EOL     | ❌ No              |

## 🚨 Reporting Security Vulnerabilities

**Please do not report security vulnerabilities through public GitHub issues.**

### Preferred Method

Send security reports to: **security@[your-domain].com**

Include:
- Description of the vulnerability
- Steps to reproduce
- Potential impact
- Suggested fix (if any)

### Response Timeline

- **24 hours**: Initial acknowledgment
- **72 hours**: Initial assessment
- **7 days**: Detailed response with timeline

## 🛡️ Security Measures

### Container Security

- **Base Images**: Only official distribution images
- **Updates**: Regular security updates via automated builds
- **Scanning**: Automated vulnerability scanning
- **Minimal Surface**: Only essential packages installed

### Build Security

- **Signed Images**: All images are signed
- **Reproducible Builds**: Deterministic build process
- **Supply Chain**: Verified base image sources
- **Secrets Management**: No hardcoded credentials

### Runtime Security

- **Non-Root User**: Ansible user for operations
- **Capabilities**: Minimal required capabilities
- **Read-Only**: Filesystem mounted read-only where possible
- **Network**: Restricted network access

## 🔍 Security Best Practices

### For Users

```yaml
# Use specific versions, not 'latest'
platforms:
  - name: test
    image: mpaivabarbosa/molecule-systemd-ubuntu:24.04
    
# Enable security options
security_opts:
  - no-new-privileges:true
  
# Use read-only root filesystem
read_only: true

# Drop unnecessary capabilities
cap_drop:
  - ALL
cap_add:
  - SYS_ADMIN  # Only if needed for systemd
```

### For Developers

```dockerfile
# Use specific base image versions
FROM ubuntu:24.04

# Don't run as root
USER ansible

# Remove package caches
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Use COPY instead of ADD
COPY file.txt /path/
```

## 🚫 Known Security Considerations

### Privileged Mode

These images require `privileged: true` for systemd:

```yaml
platforms:
  - name: test
    image: mpaivabarbosa/molecule-systemd-ubuntu:24.04
    privileged: true  # Required for systemd
```

**Risk**: Full host access
**Mitigation**: Use only in isolated test environments

### Systemd in Containers

**Risk**: Potential privilege escalation
**Mitigation**: 
- Use only for testing
- Never in production
- Isolated environments only

### EOL Distributions

**Risk**: Unpatched vulnerabilities
**Mitigation**:
- Clearly marked as EOL
- Use alternative repositories
- Regular security scanning

## 🔧 Security Configuration

### Recommended Molecule Configuration

```yaml
driver:
  name: containers
  
platforms:
  - name: test
    image: mpaivabarbosa/molecule-systemd-ubuntu:24.04
    privileged: true
    volumes:
      - /sys/fs/cgroup:/sys/fs/cgroup:ro
    security_opts:
      - apparmor:unconfined
    tmpfs:
      - /run
      - /tmp
```

### Network Security

```yaml
# Restrict network access
networks:
  - name: molecule-test
    driver: bridge
    options:
      com.docker.network.bridge.enable_icc: "false"
```

## 📊 Vulnerability Scanning

### Automated Scanning

- **GitHub Actions**: Trivy security scanning
- **Schedule**: Weekly scans
- **Reporting**: Security advisories for critical issues

### Manual Scanning

```bash
# Scan specific image
trivy image mpaivabarbosa/molecule-systemd-ubuntu:24.04

# Scan for high/critical only
trivy image --severity HIGH,CRITICAL mpaivabarbosa/molecule-systemd-ubuntu:24.04
```

## 🚨 Security Incidents

### Response Process

1. **Immediate**: Stop using affected images
2. **Assessment**: Evaluate impact and scope
3. **Mitigation**: Deploy fixes or workarounds
4. **Communication**: Notify users via GitHub
5. **Prevention**: Improve security measures

### Incident History

No security incidents reported to date.

## 📋 Security Checklist

### For New Images

- [ ] Base image is official and current
- [ ] No hardcoded secrets or credentials
- [ ] Minimal package installation
- [ ] Security scanning passed
- [ ] Documentation updated
- [ ] Test coverage includes security tests

### For Updates

- [ ] Security patches applied
- [ ] Vulnerability scan clean
- [ ] Breaking changes documented
- [ ] Backward compatibility maintained

## 🔗 Security Resources

- [Container Security Best Practices](https://kubernetes.io/docs/concepts/security/)
- [Docker Security](https://docs.docker.com/engine/security/)
- [Podman Security](https://podman.io/getting-started/security)
- [NIST Container Security Guide](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-190.pdf)

## 📞 Contact

For security-related questions:
- **Email**: security@[your-domain].com
- **GPG Key**: [Key ID if available]
- **Response Time**: 24-48 hours

---

**Remember**: These images are for testing only, never use in production environments.