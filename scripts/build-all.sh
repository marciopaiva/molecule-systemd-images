#!/bin/bash
# Build all container images

set -e

REGISTRY="${REGISTRY:-docker.io}"
NAMESPACE="${NAMESPACE:-mpaivabarbosa}"
CONTAINER_ENGINE="${CONTAINER_ENGINE:-podman}"

# Color output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

log() {
    echo -e "${GREEN}[$(date +'%Y-%m-%d %H:%M:%S')] $1${NC}"
}

error() {
    echo -e "${RED}[ERROR] $1${NC}" >&2
}

warn() {
    echo -e "${YELLOW}[WARN] $1${NC}"
}

# Build function
build_image() {
    local family=$1
    local os=$2
    local version=$3
    
    local image_path="images/${family}/${os}/${version}"
    local image_name="${REGISTRY}/${NAMESPACE}/molecule-systemd-${os}:${version}"
    
    if [ ! -f "${image_path}/Dockerfile" ]; then
        warn "Dockerfile not found: ${image_path}/Dockerfile"
        return 1
    fi
    
    log "Building ${os}:${version}"
    
    if ${CONTAINER_ENGINE} build -t "${image_name}" "${image_path}"; then
        log "✅ Built ${image_name}"
        return 0
    else
        error "❌ Failed to build ${image_name}"
        return 1
    fi
}

# Main build process
main() {
    log "Starting build process with ${CONTAINER_ENGINE}"
    
    local failed=0
    local total=0
    
    # RHEL family
    for os in amazonlinux centos rockylinux almalinux; do
        for version_dir in images/rhel-family/${os}/*/; do
            if [ -d "$version_dir" ]; then
                version=$(basename "$version_dir")
                ((total++))
                if ! build_image "rhel-family" "$os" "$version"; then
                    ((failed++))
                fi
            fi
        done
    done
    
    # Debian family
    for os in debian ubuntu; do
        for version_dir in images/debian-family/${os}/*/; do
            if [ -d "$version_dir" ]; then
                version=$(basename "$version_dir")
                ((total++))
                if ! build_image "debian-family" "$os" "$version"; then
                    ((failed++))
                fi
            fi
        done
    done
    
    # Fedora
    for version_dir in images/fedora/*/; do
        if [ -d "$version_dir" ]; then
            version=$(basename "$version_dir")
            ((total++))
            if ! build_image "" "fedora" "$version"; then
                ((failed++))
            fi
        fi
    done
    
    # Summary
    log "Build completed: $((total - failed))/${total} successful"
    
    if [ $failed -gt 0 ]; then
        error "${failed} builds failed"
        exit 1
    fi
    
    log "🎉 All builds successful!"
}

main "$@"