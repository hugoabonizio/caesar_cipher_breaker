CRYSTAL_BIN ?= $(shell which crystal)

.PHONY: clean
default: build

.PHONY: clean
clean:
	rm -f ./bin/caesar-breaker

.PHONY: dev
dev: clean
	$(CRYSTAL_BIN) build -o bin/caesar-breaker src/caesar_cipher_breaker.cr

.PHONY: build
build: clean
	$(CRYSTAL_BIN) build --release --no-debug -o bin/caesar-breaker src/caesar_cipher_breaker.cr

.PHONY: text
test:
	$(CRYSTAL_BIN) spec

.PHONY: install
install: build
	cp -f ./bin/caesar-breaker /usr/local/bin