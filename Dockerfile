FROM ubuntu:14.04
MAINTAINER Thomas Heilbronner <thomas.heilbronner@gmail.com>
RUN apt-get update && apt-get install -y python-setuptools && apt-get clean
RUN easy_install pip
RUN pip install jenkins-job-builder

