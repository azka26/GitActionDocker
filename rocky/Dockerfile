# Use the official lightweight Alpine image as the base image
FROM rockylinux:9.3

WORKDIR /cicd
COPY /required-files/ .
COPY ./run-cicd.sh .
RUN chmod +x run-cicd.sh

RUN dnf update -y && \
    dnf install -y \
    libicu \
    wget \
    tar \
    htop

RUN dnf update -y && \
    dnf install -y \
    tar \
    bash

RUN mkdir -p /usr/local/share/dotnet && \
    mkdir -p /usr/local/share/powershell

RUN tar -xzf ./dotnet-runtime-8.0.17-linux-x64.tar.gz -C /usr/local/share/dotnet && \
    rm -rf dotnet-runtime-8.0.17-linux-x64.tar.gz

RUN tar -xzf ./powershell-7.4.10-linux-x64.tar.gz -C /usr/local/share/powershell && \
    rm -rf powershell-7.4.10-linux-x64.tar.gz

RUN chmod +x /usr/local/share/powershell/pwsh

RUN tar -xzf actions-runner-linux-x64-2.325.0.tar.gz -C /cicd && \
    rm -rf actions-runner-linux-x64-2.325.0.tar.gz

RUN adduser -m cicduser && \
    chown -R cicduser:cicduser /cicd

RUN echo 'export PATH=$PATH:/usr/local/share/dotnet' >> /home/cicduser/.bashrc
RUN echo 'export PATH=$PATH:/usr/local/share/powershell' >> /home/cicduser/.bashrc

USER cicduser

# Set the default shell to bash
CMD ["/bin/bash", "-c", "./run-cicd.sh"]