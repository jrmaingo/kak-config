PREFIX:=/usr/local

default:
	echo "just install it"

install:
	mkdir -p ${HOME}/.config/kak/
	cp kakrc ${HOME}/.config/kak/
	cp -r autoload/ ${HOME}/.config/kak/
	ln -sf ${PREFIX}/share/kak/autoload/ ${HOME}/.config/kak/autoload/defaults
