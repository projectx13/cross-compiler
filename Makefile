DOCKER    = docker
IMAGE     = cross-compiler
PLATFORMS = \
	android-arm \
	android-x86 \
	android-x64 \
	darwin-x64 \
	linux-x86 \
	linux-x64 \
	linux-arm \
	windows-x86 \
	windows-x64

base:
	$(DOCKER) build -t $(IMAGE):base .

.PHONY: $(PLATFORMS)

$(PLATFORMS):
	$(DOCKER) build -t $(IMAGE):$@ $@;

all:
	$(MAKE) base
	for i in $(PLATFORMS); do \
		$(MAKE) $$i; \
	done
