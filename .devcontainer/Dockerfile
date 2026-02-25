FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential \
    gdb \
    git \
    sudo \
    gfortran \
    libreadline-dev \
    libx11-dev \
    libxt-dev \
    libpng-dev \
    libjpeg-dev \
    libcairo2-dev \
    libbz2-dev \
    libzstd-dev \
    liblzma-dev \
    libpcre2-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    texinfo \
    wget \
    file \
    zlib1g-dev \
    libpcre3-dev \
    libicu-dev \
    libxmu-dev \
    rsync \
    tcl-dev \
    tk-dev \
    libtirpc-dev \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Set env vars for debug runs
ENV LD_LIBRARY_PATH=/workspace/lib:${LD_LIBRARY_PATH}
ENV R_HOME=/workspace
ENV LC_ALL=en_US.UTF-8
ENV CFLAGS="-g -O0 -fno-inline -fno-omit-frame-pointer"
ENV CXXFLAGS="-g -O0 -fno-inline -fno-omit-frame-pointer"

# Install uv (Python package manager)
RUN wget -qO- https://astral.sh/uv/install.sh | sh
ENV PATH="/home/vscode/.local/bin:${PATH}"
ENV UV_LINK_MODE=copy

# Create vscode user
RUN useradd -m -s /bin/bash vscode
RUN echo "vscode ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/vscode
RUN chmod 0440 /etc/sudoers.d/vscode

USER vscode
WORKDIR /workspace