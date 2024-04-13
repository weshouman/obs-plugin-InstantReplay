# Use a base image with the required build tools installed.
FROM ubuntu:latest

# Install build essentials and OBS Studio development libraries.
RUN apt-get update && apt-get install -y \
    build-essential \
    pkg-config \
    cmake \
    git \
    libobs-dev

RUN apt-get install -y qt6-base-dev qt6-declarative-dev qt6-tools-dev

# Copy the plugin source code into the container.
COPY . /plugin

# Set the working directory to the plugin's source code.
WORKDIR /plugin

ENV QT_INCLUDE /usr/include/x86_64-linux-gnu/qt6
ENV QT_LIB /usr/lib/x86_64-linux-gnu/qt6
ENV OBS_LIB /usr/lib/x86_64-linux-gnu

# Specify the default command to build the plugin.
CMD ["make"]

