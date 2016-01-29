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
	docker tag cross-compiler:$(PLATFORM) quasarhq/cross-compiler:$(PLATFORM)
	docker push quasarhq/cross-compiler:$(PLATFORM)
