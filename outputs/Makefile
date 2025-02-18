#RPMS
RPMS_DIR=/app/outputs/rpms
DEPS_DIR=${RPMS_DIR}/emacs-rpm-deps
GCCJIT_DIR=${RPMS_DIR}/gcc-jit-deps
#ELPA
ELPA_DIR=/app/outputs/elpa
#EMACS SRC
EMACS_REPO_DIR=/app/outputs/emacs-repo/

download-rpms:
	dnf config-manager --set-enabled devel  # needed for some emacsdeps

	rm -r ${DEPS_DIR} ; mkdir -p ${DEPS_DIR}
	dnf builddep --destdir ${DEPS_DIR} --downloadonly -y emacs

	rm -r ${GCCJIT_DIR} ; mkdir -p ${GCCJIT_DIR}
	dnf install --destdir ${GCCJIT_DIR} --downloadonly -y gcc-toolset-9-libgccjit-devel scl-utils

install-rpms:
	rpm -ivh ${DEPS_DIR}/*.rpm
	rpm -ivh ${GCCJIT_DIR}/*.rpm

clone-emacs:
	git clone https://github.com/emacs-mirror/emacs.git ${EMACS_REPO_DIR}

new-gcc:
	scl enable gcc-toolset-9 bash

run-emacs-installer:
	cd ${EMACS_REPO_DIR}
	../emacs_install.sh

package-rpms:
	tar -czvf ${RPMS_DIR}.tar.gz ${RPMS_DIR} #decompress with tar -xzvf <name>

package-elpa:
	mkdir -p ${ELPA_DIR}
	cp -r ~/.emacs.d/elpa/* ${ELPA_DIR}
	echo "Files copied to directory: " ${ELPA_DIR}
	tar -czvf ${ELPA_DIR}.tar.gz ${ELPA_DIR} #decompress with tar -xzvf <name>
