FROM debian:bullseye-slim

LABEL maintainer="Bertrand Roussel <broussel@sierrawireless.com>"

ENV DEBIAN_FRONTEND=noninteractive
ENV VERSION=3.6.0
ENV REPO_URL=https://opendev.org/jjb/jenkins-job-builder.git

# Install required tools and dependencies

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        curl \
        git \
        bash \
        grep \
        openssh-client \
        python3-pip \
        python3-dev \
        openjdk-17-jre-headless && \
    apt-get -y -q autoclean && \
    apt-get -y -q autoremove &&\
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install pre-commit
RUN pip3 install --no-cache-dir pre-commit

# Install Node.js (via NodeSource setup script) and npm-groovy-lint
RUN curl -fsSL https://deb.nodesource.com/setup_current.x | bash - && \
    apt-get update && \
    apt-get install -y nodejs && \
    npm install --global npm-groovy-lint && \
    npm cache clean --force && \
    rm -rf /var/lib/apt/lists/*

# Install Jenkins Job Builder from Git
RUN git clone ${REPO_URL} /tmp/jjb && \
    cd /tmp/jjb && \
    git checkout ${VERSION} && \
    pip install . && \
    rm -rf /tmp/jjb

# Set default command
CMD ["/bin/bash"]
