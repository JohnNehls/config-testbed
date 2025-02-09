EXEC=podman
IMAG=my-rockylinux-dev

all: cp build run

cp:
	cp ~/dotfiles/dot-bashrc ./.bashrc
	cp ~/dotfiles/.emacs.d/init.el ./.emacs
build:
	${EXEC} build -t ${IMAG} .
run:	
	${EXEC} run -it \
        -v ~/dotfiles:/root/dotfiles \
	--rm ${IMAG}
