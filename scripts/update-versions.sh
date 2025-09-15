#!/bin/bash
# Update version information across the project

set -e

# Color output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

log() {
    echo -e "${GREEN}[$(date +'%Y-%m-%d %H:%M:%S')] $1${NC}"
}

warn() {
    echo -e "${YELLOW}[WARN] $1${NC}"
}

# Count images by family
count_images() {
    local rhel_count=0
    local debian_count=0
    local fedora_count=0
    
    # Count RHEL family
    for os in amazonlinux centos rockylinux almalinux; do
        if [ -d "images/rhel-family/${os}" ]; then
            rhel_count=$((rhel_count + $(find "images/rhel-family/${os}" -maxdepth 1 -type d | wc -l) - 1))
        fi
    done
    
    # Count Debian family
    for os in debian ubuntu; do
        if [ -d "images/debian-family/${os}" ]; then
            debian_count=$((debian_count + $(find "images/debian-family/${os}" -maxdepth 1 -type d | wc -l) - 1))
        fi
    done
    
    # Count Fedora
    if [ -d "images/fedora" ]; then
        fedora_count=$(find "images/fedora" -maxdepth 1 -type d | wc -l)
        fedora_count=$((fedora_count - 1))
    fi
    
    local total=$((rhel_count + debian_count + fedora_count))
    
    echo "RHEL family: ${rhel_count}"
    echo "Debian family: ${debian_count}"
    echo "Fedora: ${fedora_count}"
    echo "Total: ${total}"
}

# Update GitHub Actions matrix
update_github_actions() {
    log "Updating GitHub Actions matrix..."
    
    # This would need to be implemented based on actual requirements
    warn "GitHub Actions matrix update not implemented yet"
}

# Update README statistics
update_readme_stats() {
    log "Updating README statistics..."
    
    local stats=$(count_images)
    local total=$(echo "$stats" | grep "Total:" | cut -d' ' -f2)
    
    log "Found ${total} total images"
    
    # Update main README
    if [ -f "README.md" ]; then
        # This would update the README with current counts
        warn "README statistics update not implemented yet"
    fi
}

main() {
    log "Starting version update process..."
    
    count_images
    update_github_actions
    update_readme_stats
    
    log "Version update completed"
}

main "$@"