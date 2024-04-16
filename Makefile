build: index.html

index.html: build/config.toml index.html.tera
# https://github.com/guangie88/tera-cli (AUR: tera-cli)
	tera --toml build/config.toml --file index.html.tera > index.html

build/config.toml: config/*.toml build/
	cat config/*.toml > build/config.toml

build/:
	mkdir -p build

clean:
	-rm -r index.html build/
