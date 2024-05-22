build: build/assets/ build/index.html build/ppnet.private.html

build/assets/: build/ assets/*
	cp -r assets/ build/assets/

build/%.html: build/%.toml template.html.tera
# https://github.com/chevdor/tera-cli (AUR: teracli)
	tera build/$*.toml --template template.html.tera --out build/$*.html

build/%.toml: config/%/*.toml config/%/sections/*.toml
	cat config/$*/*.toml config/$*/sections/*.toml > build/$*.toml

build/:
	mkdir -p build/

clean:
	-rm -r build/

install:
	mkdir -p ~/.local/share/
	rm -rf ~/.local/share/homepage/
	cp -r build/ ~/.local/share/homepage/
