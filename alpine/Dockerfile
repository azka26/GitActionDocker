# Use the official lightweight Alpine image as the base image
FROM alpine:3.22.0

WORKDIR /cicd
COPY /required-files/ .
COPY ./run-cicd.sh .
RUN chmod +x run-cicd.sh

RUN apk add --no-cache bash tar libintl icu-libs krb5-libs zlib libssl3

RUN mkdir -p /usr/local/share/dotnet && \
    mkdir -p /usr/local/share/powershell

RUN tar -xzf ./dotnet-runtime-8.0.16-linux-musl-x64.tar.gz -C /usr/local/share/dotnet && \
    rm -rf dotnet-runtime-8.0.16-linux-musl-x64.tar.gz

RUN tar -xzf ./powershell-7.4.10-linux-musl-x64.tar.gz -C /usr/local/share/powershell && \
    rm -rf powershell-7.4.10-linux-musl-x64.tar.gz

RUN chmod +x /usr/local/share/powershell/pwsh

RUN tar -xzf actions-runner-linux-x64-2.325.0.tar.gz -C /cicd && \
    rm -rf actions-runner-linux-x64-2.325.0.tar.gz

RUN adduser -D -h /home/cicduser cicduser && \
    mkdir -p /home/cicduser && \
    chown -R cicduser:cicduser /home/cicduser /cicd

RUN echo 'export PATH=$PATH:/usr/local/share/dotnet' >> /home/cicduser/.bashrc
RUN echo 'export PATH=$PATH:/usr/local/share/powershell' >> /home/cicduser/.bashrc

#USER cicduser

# Set the default shell to bash
CMD ["/bin/bash", "-c", "./run-cicd.sh"]