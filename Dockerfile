FROM resin/armv7hf-debian

COPY qemu-arm /usr/bin/qemu-arm-static

RUN echo Hello from ARM container  
RUN \
  apt-get update && \
  apt-get upgrade -y && \
  apt-get install cmake -y && \
  apt-get -y install libcurl4-openssl-dev libssl-dev libjansson-dev automake autotools-dev build-essential git nano && \
  git clone --single-branch -b ARM https://github.com/monkins1010/ccminer && \
  cd ccminer && \
  chmod +x build.sh && chmod +x configure.sh && chmod +x autogen.sh && \
  ./build.sh && \
  rm -rf /var/lib/apt/lists/*

# Add files.
ADD root/.bashrc /root/.bashrc
ADD root/.gitconfig /root/.gitconfig
ADD root/.scripts /root/.scripts

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]
