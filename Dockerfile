FROM debian:bullseye-slim

USER root

ENV DEBIAN_FRONTEND noninteractive

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
        gnupg2 \
        aptly \
        locales && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/*

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && locale-gen

RUN echo "root:root" | chpasswd
