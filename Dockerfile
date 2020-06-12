FROM alpine:edge

MAINTAINER Bertrand Roussel <broussel@sierrawireless.com>

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk add --no-cache py-pip \
                       py3-pip \
                       git \
                       bash \
                       grep \
                       openssh \
                       build-base \
                       python3-dev

ENV VERSION 2.10.1
ENV REPO_URL https://opendev.org/jjb/jenkins-job-builder.git

# jenkins-job-builder from git
RUN ( \
        cd /tmp && \
        git clone $REPO_URL && \
        cd jenkins-job-builder && \
        git checkout $VERSION && \
        pip install . \
    )

