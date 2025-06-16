FROM ubuntu:jammy

RUN apt-get update && \
    apt-get install -y \
    tar \
    libicu-dev \
    curl \
    dotnet-runtime-6.0 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create a user
RUN useradd -m gitrunner

# Create a directory for the user's home if it doesn't exist
RUN mkdir -p /home/gitrunner

RUN mkdir /home/gitrunner/actions-runner && \
    cd /home/gitrunner/actions-runner && \
    curl -o actions-runner-linux-x64-2.317.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.317.0/actions-runner-linux-x64-2.317.0.tar.gz && \
    tar xzf ./actions-runner-linux-x64-2.317.0.tar.gz && \
    cd /home/gitrunner/actions-runner/bin && \
    chmod 755 ./installdependencies.sh && \
    ./installdependencies.sh

RUN chown gitrunner /home/gitrunner/actions-runner -R

# Set the volume
VOLUME /home/gitrunner

# Switch to the new user (optional)
USER gitrunner

CMD ["bash"]