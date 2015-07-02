# MeteorJS Base
#
# PS: Following the same MeteorJS version. Use NodeJS 0.10.
# Version: 1.1.0.2

FROM debian:jessie
MAINTAINER Jadson Lourenço <jadsonlourenco@gmail.com>
LABEL Description="Base image to use with MeteorJS app, to build and run it." Version="1.1.0.2"

# Install MeteorJS (latest) and NodeJS (0.10.x)
RUN apt-get update && \
    apt-get install -y curl wget unzip git && \
    curl -sL https://deb.nodesource.com/setup | bash - && \
    apt-get install -y nodejs build-essential && \
    curl https://install.meteor.com/ | sh && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Add user "app" to run the container as non-root
RUN groupadd app && \
    useradd -s /sbin/nologin -g app app
