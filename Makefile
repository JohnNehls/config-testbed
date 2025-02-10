EXEC=podman
IMAG=my-rockylinux-dev

all: cp_config build run

cp_config:
	cp ~/dotfiles/dot-bashrc ./.bashrc
	cp ~/dotfiles/.emacs.d/init.el ./.emacs
build:
	${EXEC} build -t ${IMAG} .
run:	
	${EXEC} run -it \
        -v ${PWD}/outputs:/app/outputs:z \
	--hostname testbed \
	--rm ${IMAG}
clean:
	${EXEC} rmi ${IMAG}
cp_elpa:	#
	cp -r ~/dotfiles/.emacs.d/elpa . ; \
        find ./elpa -name "*.elc" -exec rm {} \;  # need to remove compiled files
