FROM alpine:latest

MAINTAINER Bertrand Roussel <broussel@sierrawireless.com>

RUN apk add --no-cache py-pip git bash

ENV VERSION 2.0.0.0b2

# jenkins-job-builder from git
RUN ( \
        cd /tmp && \
        git clone git://git.openstack.org/openstack-infra/jenkins-job-builder && \
        cd jenkins-job-builder && \
        git checkout $VERSION && \
        pip install . \
    )

