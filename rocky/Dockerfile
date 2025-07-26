# Use the official lightweight Alpine image as the base image
FROM rockylinux:9.3

WORKDIR /cicd
VOLUME /cicd/runner
COPY /required-files/ .
COPY ./run-cicd.sh .
RUN chmod +x run-cicd.sh

RUN dnf update -y && \
    dnf install -y \
    libicu \
    wget \
    tar

RUN dnf update -y && \
    dnf install -y \
    tar \
    bash

RUN mkdir -p /usr/local/share/dotnet && \
    mkdir -p /usr/local/share/powershell

RUN tar -xzf ./dotnet-runtime.tar.gz -C /usr/local/share/dotnet && \
    rm -rf dotnet-runtime.tar.gz

RUN tar -xzf ./powershell.tar.gz -C /usr/local/share/powershell && \
    rm -rf powershell.tar.gz

RUN chmod +x /usr/local/share/powershell/pwsh

# RUN tar -xzf actions-runner.tar.gz -C /cicd && \
#     rm -rf actions-runner.tar.gz

RUN adduser -m cicduser && \
    chown -R cicduser:cicduser /cicd

RUN chmod +x /cicd/run-cicd.sh

RUN echo 'export PATH=$PATH:/usr/local/share/dotnet' >> /home/cicduser/.bashrc
RUN echo 'export PATH=$PATH:/usr/local/share/powershell' >> /home/cicduser/.bashrc

USER cicduser
ENV PATH="$PATH:/usr/local/share/dotnet:/usr/local/share/powershell"
# RUN source ~/.bashrc



# Set the default shell to bash
CMD ["/bin/bash", "-c", "./run-cicd.sh"]