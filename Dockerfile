FROM alpine:latest

MAINTAINER Bertrand Roussel <broussel@sierrawireless.com>

RUN apk add --no-cache py-pip git bash

ENV VERSION origin/master
ENV REPO_URL git://git.openstack.org/openstack-infra/jenkins-job-builder

# jenkins-job-builder from git
RUN ( \
        cd /tmp && \
        git clone $REPO_URL && \
        cd jenkins-job-builder && \
        git checkout $VERSION && \
        pip install . \
    )

