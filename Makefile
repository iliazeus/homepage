build: build/assets/ build/index.html

build/assets/: build/ assets/*
	cp -r assets/ build/assets/

build/%.html: build/%.toml template.html.tera
# https://github.com/guangie88/tera-cli (AUR: tera-cli)
	tera --toml build/$*.toml --file template.html.tera > build/index.html

build/%.toml: config/%/*.toml
	cat config/$*/*.toml config/$*/sections/*.toml > build/$*.toml

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
