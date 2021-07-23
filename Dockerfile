FROM ubuntu:20.04

# Install.
RUN \
  apt-get update && \
  apt-get upgrade -y && \
  apt-get -y install libcurl4-openssl-dev libssl-dev libjansson-dev automake autotools-dev build-essential git nano && \
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
