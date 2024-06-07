# Use the Debian 11 base image
FROM debian:11

# Update the package list and install dependencies
RUN apt update && \
    apt install -y git python3 python3-pip python3-venv && \
    rm -rf /var/lib/apt/lists/*

# Create a new user called 'docker' with a home directory and bash shell
RUN useradd -m -s /bin/bash docker

# Switch to the 'docker' user
USER docker

# Set the working directory to the user's home
WORKDIR /home/docker

# Clone the repository into the user's home directory
RUN git clone https://github.com/lllyasviel/stable-diffusion-webui-forge.git forge

# Set the working directory to the cloned repository
WORKDIR /home/docker/forge

# Run the web UI script
CMD ["bash", "webui.sh"]
