DOCKER    = docker
IMAGE     = cross-compiler
PLATFORMS = \
	android-arm \
	android-x64 \
	android-x86 \
	darwin-x64 \
	linux-arm \
	linux-x64 \
	linux-x86 \
	windows-x64 \
	windows-x86

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
	docker tag cross-compiler:$(PLATFORM) quasarhq/cross-compiler:$(PLATFORM)
	docker push quasarhq/cross-compiler:$(PLATFORM)
