#ubuntu
FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Shanghai
ENV ARCH=riscv32
ENV CROSS_COMPILE=/opt/rv32imac_zicsr_zifencei_multilib_b_ext-linux/bin/riscv32-unknown-elf-

# Install any needed packages specified in requirements.txt
RUN apt-get update && \
    apt-get install -y \
    git \
    wget \
    curl \
    unzip \
    python3 \
    python3-pip \
    python3-setuptools \
    build-essential \
    make \
    cmake \
    ninja-build \
    ccache \
    doxygen \
    libffi-dev \
    libssl-dev \
    dfu-util \
    libusb-1.0-0 \
    libc6-i386 \
    libc6-i386-cross \
    libstdc++6-i386-cross \
    && apt-get clean

WORKDIR /opt

RUN wget https://github.com/hpmicro/riscv-gnu-toolchain/releases/download/2023.10.18/rv32imac_zicsr_zifencei_multilib_b_ext-linux.tar.gz \
    && tar -zxvf rv32imac_zicsr_zifencei_multilib_b_ext-linux.tar.gz \
    && rm rv32imac_zicsr_zifencei_multilib_b_ext-linux.tar.gz

RUN pip install \
    Sphinx==5.3.0 \
    sphinx-rtd-theme==2.0.0 \
    myst-parser==0.18.1 \
    sphinx-inline-tabs \
    sphinxcontrib-moderncmakedomain

WORKDIR /home

CMD [ "/bin/bash" ]
