#!/usr/bin/env python3
"""
Basic integration tests for molecule-systemd images
"""

import subprocess
import sys
import os

def run_command(cmd):
    """Run command and return result"""
    try:
        result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
        return result.returncode == 0, result.stdout, result.stderr
    except Exception as e:
        return False, "", str(e)

def test_image_basic_functionality(image_name):
    """Test basic image functionality"""
    print(f"Testing image: {image_name}")
    
    # Test 1: Basic run
    success, stdout, stderr = run_command(f"podman run --rm {image_name} echo 'test'")
    assert success, f"Basic run failed: {stderr}"
    assert "test" in stdout, "Echo command failed"
    print("✅ Basic run test passed")
    
    # Test 2: Python availability
    success, stdout, stderr = run_command(f"podman run --rm {image_name} python3 --version")
    assert success, f"Python test failed: {stderr}"
    assert "Python 3" in stdout, "Python 3 not available"
    print("✅ Python test passed")
    
    # Test 3: Systemd availability
    success, stdout, stderr = run_command(f"podman run --rm {image_name} which systemctl")
    assert success, f"Systemd test failed: {stderr}"
    print("✅ Systemd test passed")
    
    # Test 4: Ansible user
    success, stdout, stderr = run_command(f"podman run --rm {image_name} id ansible")
    assert success, f"Ansible user test failed: {stderr}"
    print("✅ Ansible user test passed")
    
    # Test 5: Sudo privileges
    success, stdout, stderr = run_command(f"podman run --rm {image_name} sudo -u ansible sudo -n true")
    assert success, f"Sudo test failed: {stderr}"
    print("✅ Sudo test passed")

def main():
    """Main test function"""
    if len(sys.argv) != 2:
        print("Usage: python3 test_basic.py <image_name>")
        print("Example: python3 test_basic.py mpaivabarbosa/molecule-systemd-ubuntu:24.04")
        sys.exit(1)
    
    image_name = sys.argv[1]
    
    try:
        test_image_basic_functionality(image_name)
        print(f"🎉 All tests passed for {image_name}!")
    except AssertionError as e:
        print(f"❌ Test failed: {e}")
        sys.exit(1)
    except Exception as e:
        print(f"❌ Unexpected error: {e}")
        sys.exit(1)

if __name__ == "__main__":
    main()