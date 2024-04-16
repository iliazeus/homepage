build: build/assets/ build/index.html

build/assets/: build/ assets/*
	cp -r assets/ build/assets/

build/index.html: build/ build/config.toml index.html.tera
# https://github.com/guangie88/tera-cli (AUR: tera-cli)
	tera --toml build/config.toml --file index.html.tera > build/index.html

build/config.toml: config/*.toml build/
	cat config/*.toml > build/config.toml

build/:
	mkdir -p build/

clean:
	-rm -r build/

build-docker:
	docker build . -o type=local,dest=build/

install:
	mkdir -p ~/.local/share/
	rm -rf ~/.local/share/homepage/
	cp -r build/ ~/.local/share/homepage/
