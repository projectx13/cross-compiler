# Name of the project.
PROJECT = quasarhq
IMAGE = cross-compiler

# Set binaries and platform specific variables.
DOCKER = docker

# Platforms on which we want to build the project.
PLATFORMS = \
	android-arm \
	android-x64 \
	android-x86 \
	darwin-x64 \
	linux-arm \
	linux-armv7 \
	linux-x64 \
	linux-x86 \
	windows-x64 \
	windows-x86

.PHONY: $(PLATFORMS)

all:
	for i in $(PLATFORMS); do \
		$(MAKE) $$i; \
	done

base:
	$(DOCKER) build -t $(IMAGE):base .

$(PLATFORMS): base
	$(DOCKER) build -t $(IMAGE):$@ $@;

push:
	docker tag cross-compiler:$(PLATFORM) $(PROJECT)/cross-compiler:$(PLATFORM)
	docker push $(PROJECT)/cross-compiler:$(PLATFORM)
