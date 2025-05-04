FROM debian:stable-20250428-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    texlive-xetex \
    texlive-latex-recommended \
    texlive-latex-extra \
    texlive-fonts-recommended \
    texlive-fonts-extra \
    evince && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /data

VOLUME ["/data"]