#!/bin/bash

# source ~/.bashrc
if [ ! -f /cicd/runner/run.sh ]; then
    echo "Actions runner not found, extracting..."
    tar -xzf ./actions-runner.tar.gz -C /cicd/runner
fi

chmod +x /cicd/runner/*.sh
cd /cicd/runner
while true; do
    ./run.sh
    sleep 5
done
