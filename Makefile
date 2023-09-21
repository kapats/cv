SHELL=/usr/bin/env bash
MAKEFLAGS += --no-print-directory
export DOCKER_ORG ?= kapats
export DOCKER_IMAGE ?= $(DOCKER_ORG)/cv
export DOCKER_TAG ?= latest

.PHONY : all
all: build
	@exit 0

.PHONY : build
## Build docker image
build:
	docker build -t $(DOCKER_IMAGE):$(DOCKER_TAG) .

.PHONY : push
## Push docker image to registry
push:
	docker push $(DOCKER_IMAGE):$(DOCKER_TAG)

.PHONY : run
## Run docker with root user
run:
	docker run --rm -ti -v `pwd`:/cv kapats/cv  bash
