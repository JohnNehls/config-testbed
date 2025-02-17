#!/usr/bin/env bash

# Storage directories
DEPS_DIR=/app/outputs/emacs-rpm-deps
GCCJIT_DIR=/app/outputs/gcc-jit-deps

### DOWNLOAD
dnf config-manager --set-enabled devel

rm -r $DEPS_DIR ; mkdir $DEPS_DIR
dnf builddep --destdir $DEPS_DIR --downloadonly  -y emacs

rm -r $GCCJIT_DIR ; mkdir $GCCJIT_DIR
dnf install  --destdir $GCCJIT_DIR --downloadonly  -y gcc-toolset-9-libgccjit-devel scl-utils
# dnf download --alldeps --destdir $DEPS_DIR  -y gcc-toolset-9-libgccjit-devel scl-utils

### INSTALL
rpm -ivh ${DEPS_DIR}/*.rpm
rpm -ivh ${GCCJIT_DIR}/*.rpm

### RUN
cd /app/outputs/emacs/
# scl enable gcc-toolset-9 bash  #activate new gcc
scl enable gcc-toolset-9 ../emacs_install.sh  #activate new gcc
