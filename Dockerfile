FROM alpine:3.4

MAINTAINER Bertrand Roussel <broussel@sierrawireless.com>

RUN apk add --no-cache py-pip git

ENV VERSION 1.6.1

# jenkins-job-builder from git
RUN ( \
        cd /tmp && \
        git clone git://git.openstack.org/openstack-infra/jenkins-job-builder && \
        cd jenkins-job-builder && \
        git checkout $VERSION && \
        pip install . \
    )

