

build: amazonlinux centos debian fedora

amazonlinux:
	cd ./amazonlinux/2 && docker build -t mpaivabarbosa/molecule-systemd-amazonlinux:latest .
	cd ./amazonlinux/2 && docker build -t mpaivabarbosa/molecule-systemd-amazonlinux:2 .

centos:
	cd ./centos/8 && docker build -t mpaivabarbosa/molecule-systemd-centos:latest .
	cd ./centos/8 && docker build -t mpaivabarbosa/molecule-systemd-centos:8 .
	cd ./centos/7 && docker build -t mpaivabarbosa/molecule-systemd-centos:7 .

debian:
	cd ./debian/10 && docker build -t mpaivabarbosa/molecule-systemd-debian:latest .
	cd ./debian/10 && docker build -t mpaivabarbosa/molecule-systemd-debian:10 .
	cd ./debian/9  && docker build -t mpaivabarbosa/molecule-systemd-debian:9 .

fedora:
	cd ./fedora/32 && docker build -t mpaivabarbosa/molecule-systemd-fedora:latest .
	cd ./fedora/32 && docker build -t mpaivabarbosa/molecule-systemd-fedora:32 .
	cd ./fedora/31 && docker build -t mpaivabarbosa/molecule-systemd-fedora:31 .

release:
	@if ! docker images $(NAME)/base | awk '{ print $$2 }' | grep -q -F $(VERSION); then echo "$(NAME)/base version $(VERSION) is not yet built. Please run 'make build'"; false; fi
	@if ! docker images $(NAME)/hub | awk '{ print $$2 }' | grep -q -F $(VERSION); then echo "$(NAME)/hub version $(VERSION) is not yet built. Please run 'make build'"; false; fi
	@if ! docker images $(NAME)/node-base | awk '{ print $$2 }' | grep -q -F $(VERSION); then echo "$(NAME)/node-base version $(VERSION) is not yet built. Please run 'make build'"; false; fi
	@if ! docker images $(NAME)/node-chrome | awk '{ print $$2 }' | grep -q -F $(VERSION); then echo "$(NAME)/node-chrome version $(VERSION) is not yet built. Please run 'make build'"; false; fi
	@if ! docker images $(NAME)/node-firefox | awk '{ print $$2 }' | grep -q -F $(VERSION); then echo "$(NAME)/node-firefox version $(VERSION) is not yet built. Please run 'make build'"; false; fi
	@if ! docker images $(NAME)/node-opera | awk '{ print $$2 }' | grep -q -F $(VERSION); then echo "$(NAME)/node-opera version $(VERSION) is not yet built. Please run 'make build'"; false; fi
	@if ! docker images $(NAME)/node-chrome-debug | awk '{ print $$2 }' | grep -q -F $(VERSION); then echo "$(NAME)/node-chrome-debug version $(VERSION) is not yet built. Please run 'make build'"; false; fi
	@if ! docker images $(NAME)/node-firefox-debug | awk '{ print $$2 }' | grep -q -F $(VERSION); then echo "$(NAME)/node-firefox-debug version $(VERSION) is not yet built. Please run 'make build'"; false; fi
	@if ! docker images $(NAME)/node-opera-debug | awk '{ print $$2 }' | grep -q -F $(VERSION); then echo "$(NAME)/node-opera-debug version $(VERSION) is not yet built. Please run 'make build'"; false; fi
	@if ! docker images $(NAME)/standalone-chrome | awk '{ print $$2 }' | grep -q -F $(VERSION); then echo "$(NAME)/standalone-chrome version $(VERSION) is not yet built. Please run 'make build'"; false; fi
	@if ! docker images $(NAME)/standalone-firefox | awk '{ print $$2 }' | grep -q -F $(VERSION); then echo "$(NAME)/standalone-firefox version $(VERSION) is not yet built. Please run 'make build'"; false; fi
	@if ! docker images $(NAME)/standalone-opera | awk '{ print $$2 }' | grep -q -F $(VERSION); then echo "$(NAME)/standalone-opera version $(VERSION) is not yet built. Please run 'make build'"; false; fi
	@if ! docker images $(NAME)/standalone-chrome-debug | awk '{ print $$2 }' | grep -q -F $(VERSION); then echo "$(NAME)/standalone-chrome-debug version $(VERSION) is not yet built. Please run 'make build'"; false; fi
	@if ! docker images $(NAME)/standalone-firefox-debug | awk '{ print $$2 }' | grep -q -F $(VERSION); then echo "$(NAME)/standalone-firefox-debug version $(VERSION) is not yet built. Please run 'make build'"; false; fi
	@if ! docker images $(NAME)/standalone-opera-debug | awk '{ print $$2 }' | grep -q -F $(VERSION); then echo "$(NAME)/standalone-opera-debug version $(VERSION) is not yet built. Please run 'make build'"; false; fi
	docker push $(NAME)/base:$(VERSION)


.PHONY: build amazonlinux centos debian fedora 
