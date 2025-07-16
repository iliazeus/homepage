build: build/assets/ build/index.html

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

install_from_wsl:
	rm -rf "/mnt/c/Users/$$USER/homepage/"
	cp -r build/ "/mnt/c/Users/$$USER/homepage/"

install_tera_amd64_deb:
	wget -O tera.deb 'https://github.com/chevdor/tera-cli/releases/download/v0.5.0/tera-cli_linux_amd64.deb'
	sudo dpkg -i tera.deb
	rm -rf tera.deb
