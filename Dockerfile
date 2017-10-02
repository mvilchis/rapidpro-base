FROM ubuntu:latest
MAINTAINER Miguel Vilchis "mvilchis@ciencias.unam.mx"
COPY ./geolibs.sh /
RUN apt-get update && \
  apt-get install -y --no-install-recommends \
  bash \
  patch \
  git \
  gcc \
  g++ \
  make \
  libc-dev \
  musl-dev \
  libpng-dev \
  libxslt-dev \
  libxml2-dev \
  libffi-dev \
sh /geolibs.sh \




