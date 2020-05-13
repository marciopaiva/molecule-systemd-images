

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
	@docker push mpaivabarbosa/molecule-systemd-amazonlinux:latest
	@docker push mpaivabarbosa/molecule-systemd-amazonlinux:2
	@docker push mpaivabarbosa/molecule-systemd-centos:latest
	@docker push mpaivabarbosa/molecule-systemd-centos:8
	@docker push mpaivabarbosa/molecule-systemd-centos:7
	@docker push mpaivabarbosa/molecule-systemd-debian:latest
	@docker push mpaivabarbosa/molecule-systemd-debian:10
	@docker push mpaivabarbosa/molecule-systemd-debian:9
	@docker push mpaivabarbosa/molecule-systemd-fedora:latest
	@docker push mpaivabarbosa/molecule-systemd-fedora:32
	@docker push mpaivabarbosa/molecule-systemd-fedora:31

.PHONY: build amazonlinux centos debian fedora release
