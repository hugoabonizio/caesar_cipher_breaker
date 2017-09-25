CRYSTAL_BIN ?= $(shell which crystal)

clean:
	rm -f ./bin/caesar-breaker

dev: clean
	$(CRYSTAL_BIN) build -o bin/caesar-breaker src/caesar_cipher_breaker.cr $(CRFLAGS)

build: clean
	$(CRYSTAL_BIN) build --release -o bin/caesar-breaker $(CRFLAGS)

test:
	$(CRYSTAL_BIN) spec