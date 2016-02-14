NAME = spali/docker-gen
VERSION = latest

.PHONY: all build

all: build

build:
	docker build -t $(NAME):$(VERSION) --rm .

