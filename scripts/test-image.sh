#!/bin/bash
# Test a specific container image

set -e

CONTAINER_ENGINE="${CONTAINER_ENGINE:-podman}"
REGISTRY="${REGISTRY:-docker.io}"
NAMESPACE="${NAMESPACE:-mpaivabarbosa}"

usage() {
    echo "Usage: $0 <os> <version>"
    echo "Example: $0 ubuntu 24.04"
    exit 1
}

if [ $# -ne 2 ]; then
    usage
fi

OS=$1
VERSION=$2
IMAGE_NAME="${REGISTRY}/${NAMESPACE}/molecule-systemd-${OS}:${VERSION}"

echo "🧪 Testing image: ${IMAGE_NAME}"

# Test 1: Basic run
echo "Test 1: Basic container run"
if ${CONTAINER_ENGINE} run --rm "${IMAGE_NAME}" /bin/bash -c "echo 'Container runs successfully'"; then
    echo "✅ Basic run test passed"
else
    echo "❌ Basic run test failed"
    exit 1
fi

# Test 2: Systemd availability
echo "Test 2: Systemd availability"
if ${CONTAINER_ENGINE} run --rm "${IMAGE_NAME}" /bin/bash -c "which systemctl"; then
    echo "✅ Systemd test passed"
else
    echo "❌ Systemd test failed"
    exit 1
fi

# Test 3: Python availability
echo "Test 3: Python availability"
if ${CONTAINER_ENGINE} run --rm "${IMAGE_NAME}" /bin/bash -c "python3 --version"; then
    echo "✅ Python test passed"
else
    echo "❌ Python test failed"
    exit 1
fi

# Test 4: Ansible user
echo "Test 4: Ansible user"
if ${CONTAINER_ENGINE} run --rm "${IMAGE_NAME}" /bin/bash -c "id ansible"; then
    echo "✅ Ansible user test passed"
else
    echo "❌ Ansible user test failed"
    exit 1
fi

# Test 5: Sudo privileges
echo "Test 5: Sudo privileges"
if ${CONTAINER_ENGINE} run --rm "${IMAGE_NAME}" /bin/bash -c "sudo -u ansible sudo -n true"; then
    echo "✅ Sudo test passed"
else
    echo "❌ Sudo test failed"
    exit 1
fi

echo "🎉 All tests passed for ${IMAGE_NAME}!"