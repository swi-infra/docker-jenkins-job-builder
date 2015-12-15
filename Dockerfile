FROM ubuntu:14.04

MAINTAINER Bertrand Roussel <broussel@sierrawireless.com>

RUN apt-get update
RUN apt-get install -y python-setuptools python-dev libyaml-dev git

RUN easy_install pip

ENV VERSION 1.3.0

# jenkins-job-builder from git
RUN ( \
        cd /tmp && \
        git clone git://git.openstack.org/openstack-infra/jenkins-job-builder && \
        cd jenkins-job-builder && \
        git checkout $VERSION && \
        pip install . \
    )

# plugin slack
RUN ( \
        pip install jenkins-jobs-slack \
    )

