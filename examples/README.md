# Example Configurations

This directory contains example configurations for using the Molecule Systemd Images.

## molecule.yml

Complete example configuration file showing:

- **Modern distributions** - Latest recommended versions
- **Legacy distributions** - For compatibility testing
- **Optimized settings** - Best practices for Molecule v6+
- **Full test sequence** - Complete testing workflow

## Usage

1. **Copy to your role:**
   ```bash
   cp examples/molecule.yml your-role/molecule/default/
   ```

2. **Customize platforms:**
   - Remove distributions you don't need
   - Add specific versions if required
   - Adjust hostnames and settings

3. **Run tests:**
   ```bash
   cd your-role
   molecule test
   ```

## Platform Selection

**For comprehensive testing:**
- Use all 6 distribution families (29 total images)
- Covers major Linux families (RHEL, Debian, Fedora)

**For focused testing:**
- Choose 2-3 key distributions
- Include at least one from each family

**For CI/CD:**
- Use latest versions only
- Consider build time vs coverage trade-offs

## Performance Tips

- Use `pre_build_image: true` to avoid rebuilding
- Enable `privileged: true` for systemd support
- Mount `/sys/fs/cgroup:ro` for proper systemd operation
- Set `override_command: false` to use systemd init