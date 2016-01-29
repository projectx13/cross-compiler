DOCKER    = docker
IMAGE     = cross-compiler
PLATFORMS = \
	android-arm \
	android-x64 \
	darwin-x64 \
	linux-x86 \
	linux-x64 \
	linux-arm \
	windows-x86 \
	windows-x64

.PHONY: $(PLATFORMS)

all:
	$(MAKE) base
	for i in $(PLATFORMS); do \
		$(MAKE) $$i; \
	done

base:
	$(DOCKER) build -t $(IMAGE):base .

$(PLATFORMS):
	$(DOCKER) build -t $(IMAGE):$@ $@;

push:
	docker login -e="$DOCKER_EMAIL" -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD"
	for i in $(PLATFORMS); do \
	  docker tag cross-compiler:$$i quasarhq/cross-compiler:$$i; \
	  docker push quasarhq/cross-compiler:$$i; \
	done
