#
# Molecule Systemd Images
# Base container images for testing using Ansible Molecule test framework with Podman support
#
# Repository: https://github.com/marciopaiva/molecule-systemd-images
# Registry: https://hub.docker.com/u/mpaivabarbosa
# License: MIT
#
# Supported distributions:
#   - Amazon Linux (2, 2023)
#   - CentOS (7, 8) - Legacy
#   - Rocky Linux (8, 9)
#   - AlmaLinux (8, 9, 10)
#   - Oracle Linux (8, 9, 10)
#   - Debian (9, 10, 11, 12, 13)
#   - Fedora (31, 32, 36-42)
#   - Ubuntu (18.04, 19.10, 20.04, 21.04, 22.04, 23.04, 24.04)
#
# Usage:
#   make build          - Build all images
#   make amazonlinux    - Build Amazon Linux images
#   make release        - Push images to registry
#   make help           - Show all available targets
#

CONTAINER_ENGINE ?= podman
REGISTRY ?= docker.io
NAMESPACE ?= mpaivabarbosa

# Build all images
build: amazonlinux centos rockylinux almalinux oraclelinux debian fedora ubuntu



# Test single image
test:
	@echo "Usage: make test IMAGE=<image-name>"
	@echo "Example: make test IMAGE=ubuntu:24.04"
	@if [ -n "$(IMAGE)" ]; then \
		$(CONTAINER_ENGINE) run --rm -it $(REGISTRY)/$(NAMESPACE)/molecule-systemd-$(IMAGE) /bin/bash; \
	fi

# List all built images
list:
	@$(CONTAINER_ENGINE) images $(REGISTRY)/$(NAMESPACE)/molecule-systemd-*

# Show image sizes
sizes:
	@$(CONTAINER_ENGINE) images --format "table {{.Repository}}:{{.Tag}}\t{{.Size}}" $(REGISTRY)/$(NAMESPACE)/molecule-systemd-*

amazonlinux:
	cd ./images/rhel-family/amazonlinux/2 && $(CONTAINER_ENGINE) build -t $(REGISTRY)/$(NAMESPACE)/molecule-systemd-amazonlinux:2 .
	cd ./images/rhel-family/amazonlinux/2023 && $(CONTAINER_ENGINE) build -t $(REGISTRY)/$(NAMESPACE)/molecule-systemd-amazonlinux:2023 .
	$(CONTAINER_ENGINE) tag $(REGISTRY)/$(NAMESPACE)/molecule-systemd-amazonlinux:2023 $(REGISTRY)/$(NAMESPACE)/molecule-systemd-amazonlinux:latest

centos:
	cd ./images/rhel-family/centos/8 && $(CONTAINER_ENGINE) build -t $(REGISTRY)/$(NAMESPACE)/molecule-systemd-centos:8 .
	cd ./images/rhel-family/centos/7 && $(CONTAINER_ENGINE) build -t $(REGISTRY)/$(NAMESPACE)/molecule-systemd-centos:7 .

rockylinux:
	cd ./images/rhel-family/rockylinux/8 && $(CONTAINER_ENGINE) build -t $(REGISTRY)/$(NAMESPACE)/molecule-systemd-rockylinux:8 .
	cd ./images/rhel-family/rockylinux/9 && $(CONTAINER_ENGINE) build -t $(REGISTRY)/$(NAMESPACE)/molecule-systemd-rockylinux:9 .
	$(CONTAINER_ENGINE) tag $(REGISTRY)/$(NAMESPACE)/molecule-systemd-rockylinux:9 $(REGISTRY)/$(NAMESPACE)/molecule-systemd-rockylinux:latest

almalinux:
	cd ./images/rhel-family/almalinux/8 && $(CONTAINER_ENGINE) build -t $(REGISTRY)/$(NAMESPACE)/molecule-systemd-almalinux:8 .
	cd ./images/rhel-family/almalinux/9 && $(CONTAINER_ENGINE) build -t $(REGISTRY)/$(NAMESPACE)/molecule-systemd-almalinux:9 .
	cd ./images/rhel-family/almalinux/10 && $(CONTAINER_ENGINE) build -t $(REGISTRY)/$(NAMESPACE)/molecule-systemd-almalinux:10 .
	$(CONTAINER_ENGINE) tag $(REGISTRY)/$(NAMESPACE)/molecule-systemd-almalinux:10 $(REGISTRY)/$(NAMESPACE)/molecule-systemd-almalinux:latest

oraclelinux:
	cd ./images/rhel-family/oraclelinux/8 && $(CONTAINER_ENGINE) build -t $(REGISTRY)/$(NAMESPACE)/molecule-systemd-oraclelinux:8 .
	cd ./images/rhel-family/oraclelinux/9 && $(CONTAINER_ENGINE) build -t $(REGISTRY)/$(NAMESPACE)/molecule-systemd-oraclelinux:9 .
	cd ./images/rhel-family/oraclelinux/10 && $(CONTAINER_ENGINE) build -t $(REGISTRY)/$(NAMESPACE)/molecule-systemd-oraclelinux:10 .
	$(CONTAINER_ENGINE) tag $(REGISTRY)/$(NAMESPACE)/molecule-systemd-oraclelinux:10 $(REGISTRY)/$(NAMESPACE)/molecule-systemd-oraclelinux:latest

debian:
	cd ./images/debian-family/debian/9 && $(CONTAINER_ENGINE) build -t $(REGISTRY)/$(NAMESPACE)/molecule-systemd-debian:9 .
	cd ./images/debian-family/debian/10 && $(CONTAINER_ENGINE) build -t $(REGISTRY)/$(NAMESPACE)/molecule-systemd-debian:10 .
	cd ./images/debian-family/debian/11 && $(CONTAINER_ENGINE) build -t $(REGISTRY)/$(NAMESPACE)/molecule-systemd-debian:11 .
	cd ./images/debian-family/debian/12 && $(CONTAINER_ENGINE) build -t $(REGISTRY)/$(NAMESPACE)/molecule-systemd-debian:12 .
	cd ./images/debian-family/debian/13 && $(CONTAINER_ENGINE) build -t $(REGISTRY)/$(NAMESPACE)/molecule-systemd-debian:13 .
	$(CONTAINER_ENGINE) tag $(REGISTRY)/$(NAMESPACE)/molecule-systemd-debian:13 $(REGISTRY)/$(NAMESPACE)/molecule-systemd-debian:latest

fedora:
	cd ./images/fedora/31 && $(CONTAINER_ENGINE) build -t $(REGISTRY)/$(NAMESPACE)/molecule-systemd-fedora:31 .
	cd ./images/fedora/32 && $(CONTAINER_ENGINE) build -t $(REGISTRY)/$(NAMESPACE)/molecule-systemd-fedora:32 .
	cd ./images/fedora/36 && $(CONTAINER_ENGINE) build -t $(REGISTRY)/$(NAMESPACE)/molecule-systemd-fedora:36 .
	cd ./images/fedora/37 && $(CONTAINER_ENGINE) build -t $(REGISTRY)/$(NAMESPACE)/molecule-systemd-fedora:37 .
	cd ./images/fedora/38 && $(CONTAINER_ENGINE) build -t $(REGISTRY)/$(NAMESPACE)/molecule-systemd-fedora:38 .
	cd ./images/fedora/39 && $(CONTAINER_ENGINE) build -t $(REGISTRY)/$(NAMESPACE)/molecule-systemd-fedora:39 .
	cd ./images/fedora/40 && $(CONTAINER_ENGINE) build -t $(REGISTRY)/$(NAMESPACE)/molecule-systemd-fedora:40 .
	cd ./images/fedora/41 && $(CONTAINER_ENGINE) build -t $(REGISTRY)/$(NAMESPACE)/molecule-systemd-fedora:41 .
	cd ./images/fedora/42 && $(CONTAINER_ENGINE) build -t $(REGISTRY)/$(NAMESPACE)/molecule-systemd-fedora:42 .
	cd ./images/fedora/43 && $(CONTAINER_ENGINE) build -t $(REGISTRY)/$(NAMESPACE)/molecule-systemd-fedora:43 .
	cd ./images/fedora/44 && $(CONTAINER_ENGINE) build -t $(REGISTRY)/$(NAMESPACE)/molecule-systemd-fedora:44 .
	$(CONTAINER_ENGINE) tag $(REGISTRY)/$(NAMESPACE)/molecule-systemd-fedora:44 $(REGISTRY)/$(NAMESPACE)/molecule-systemd-fedora:latest

ubuntu:
	cd ./images/debian-family/ubuntu/18.04 && $(CONTAINER_ENGINE) build -t $(REGISTRY)/$(NAMESPACE)/molecule-systemd-ubuntu:18.04 .
	cd ./images/debian-family/ubuntu/19.10 && $(CONTAINER_ENGINE) build -t $(REGISTRY)/$(NAMESPACE)/molecule-systemd-ubuntu:19.10 .
	cd ./images/debian-family/ubuntu/20.04 && $(CONTAINER_ENGINE) build -t $(REGISTRY)/$(NAMESPACE)/molecule-systemd-ubuntu:20.04 .
	cd ./images/debian-family/ubuntu/21.04 && $(CONTAINER_ENGINE) build -t $(REGISTRY)/$(NAMESPACE)/molecule-systemd-ubuntu:21.04 .
	cd ./images/debian-family/ubuntu/22.04 && $(CONTAINER_ENGINE) build -t $(REGISTRY)/$(NAMESPACE)/molecule-systemd-ubuntu:22.04 .
	cd ./images/debian-family/ubuntu/23.04 && $(CONTAINER_ENGINE) build -t $(REGISTRY)/$(NAMESPACE)/molecule-systemd-ubuntu:23.04 .
	cd ./images/debian-family/ubuntu/24.04 && $(CONTAINER_ENGINE) build -t $(REGISTRY)/$(NAMESPACE)/molecule-systemd-ubuntu:24.04 .
	$(CONTAINER_ENGINE) tag $(REGISTRY)/$(NAMESPACE)/molecule-systemd-ubuntu:24.04 $(REGISTRY)/$(NAMESPACE)/molecule-systemd-ubuntu:latest



# Clean up images
clean:
	@$(CONTAINER_ENGINE) rmi -f $$($(CONTAINER_ENGINE) images -q $(REGISTRY)/$(NAMESPACE)/molecule-systemd-* 2>/dev/null) 2>/dev/null || true

# Clean dangling images
clean-dangling:
	@$(CONTAINER_ENGINE) image prune -f

# Login to registry
login:
	@$(CONTAINER_ENGINE) login $(REGISTRY)

# Show help
help:
	@echo "Available targets:"
	@echo "  build          - Build all images"

	@echo "  amazonlinux    - Build Amazon Linux images"
	@echo "  centos         - Build CentOS images"
	@echo "  rockylinux     - Build Rocky Linux images"
	@echo "  almalinux      - Build AlmaLinux images"
	@echo "  debian         - Build Debian images"
	@echo "  fedora         - Build Fedora images"
	@echo "  ubuntu         - Build Ubuntu images"

	@echo "  test           - Test specific image (use IMAGE=name:tag)"
	@echo "  list           - List all built images"
	@echo "  sizes          - Show image sizes"
	@echo "  clean          - Remove all built images"
	@echo "  clean-dangling - Remove dangling images"
	@echo "  login          - Login to registry"
	@echo "  help           - Show this help"
	@echo ""
	@echo "Variables:"
	@echo "  CONTAINER_ENGINE - Container engine (default: podman)"
	@echo "  REGISTRY         - Registry URL (default: docker.io)"
	@echo "  NAMESPACE        - Registry namespace (default: mpaivabarbosa)"

.PHONY: build amazonlinux centos rockylinux almalinux debian fedora ubuntu test list sizes clean clean-dangling login help