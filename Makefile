SHELL = "/bin/bash"

builddir:
	mkdir -p build

build/keybindings.json: builddir source/keybindings.json
	./tools/prepareJSON "source/keybindings.json" "build/keybindings.json"

build/dotXCompose: builddir build/keybindings.json
	./tools/generateXCompose "build/keybindings.json" "build/dotXCompose"

www/keybindings.json: build/keybindings.json
	cp "build/keybindings.json" "www/keybindings.json"

www: www/keybindings.json

install: build/dotXCompose
	./tools/install

clean:
	rm build/*