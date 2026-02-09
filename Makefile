all:

install:
	cp index.html "$$HOME/index.html"

uninstall:
	rm -f "$$HOME/index.html"

wsl-install:
	cp index.html "/mnt/c/Users/$$USER/index.html"

wsl-uninstall:
	rm -f "/mnt/c/Users/$$USER/index.html"
