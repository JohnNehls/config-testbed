# Set base image
FROM rockylinux:8

# Update the package manager and install development tools
RUN dnf -y update && \
    dnf -y groupinstall "Development Tools" && \
    dnf -y install \
        emacs \
        git \
        python3 \      
        python3-pip && \
    dnf clean all

# Set up a working directory
WORKDIR /app

COPY .emacs /root
RUN mkdir -p ~/Documents/gtd
COPY .bashrc /root


# Default command
CMD ["/bin/bash"]
