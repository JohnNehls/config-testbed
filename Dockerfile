# Set base image
FROM rockylinux:8

# Update the package manager and install development tools
RUN dnf -y update && \
    dnf -y groupinstall "Development Tools" && \
    dnf -y install \
        gcc \
        emacs \
        git \
        python3 \      
        python3-pip && \
    dnf clean all

# Set up a working directory
WORKDIR /app

RUN mkdir -p /root/.emacs.d/
# make sure the init.el runs no matter how old the emacs is
RUN echo "(load-file \"~/.emacs.d/init.el\")" > /root/.emacs
COPY .emacs /root/.emacs.d/init.el
RUN mkdir -p /root/Documents/gtd

COPY .bashrc /root

#WORKDIR /root
# Default command
CMD ["/bin/bash"]
