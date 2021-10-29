#! /bin/bash

set -ex

if [[ $(arch) == "aarch64" ]]
then
    TARGETARCH="arm64"
elif [[ $(arch) == "armv7l" ]]
then
    TARGETARCH="arm"
else
    echo "Unsupported arch: $(arch)"
    exit 1
fi

AGENT_VERSION="2.194.0"
AZP_AGENTPACKAGE_URL="https://vstsagentpackage.azureedge.net/agent/${AGENT_VERSION}/vsts-agent-linux-${TARGETARCH}-${AGENT_VERSION}.tar.gz"

echo "APT::Get::Assume-Yes \"true\";" > /etc/apt/apt.conf.d/90assumeyes

apt-get update -q
apt-get install -q --no-install-recommends \
    sudo \
    ca-certificates \
    curl \
    jq \
    git \
    iputils-ping \
    libcurl4 \
    libicu63 \
    libunwind8 \
    netcat \
    libssl1.0 \
    build-essential

echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

curl -sSL https://aka.ms/InstallAzureCLIDeb | bash
curl -LsS "${AZP_AGENTPACKAGE_URL}" | tar -xz

rm -rf /var/lib/apt/lists/*
