FROM ubuntu:latest
MAINTAINER Miguel Vilchis "mvilchis@ciencias.unam.mx"

#################  Enviroment variables  #################
ENV C_FORCE_ROOT True
ENV UWSGI_WSGI_FILE=temba/wsgi.py
ENV UWSGI_HTTP=:8000
ENV UWSGI_MASTER=1
ENV UWSGI_WORKERS=8
ENV UWSGI_HARAKIRI=20                                                                                                                         
ENV LANG C.UTF-8
ENV TZ=America/Los_Angeles
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

#################     Work directory     #################
RUN mkdir rapidpro
WORKDIR /rapidpro
ADD . /rapidpro
RUN mkdir /var/log/celery

#################     Install packages    #################
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
  ncurses-dev \
  nodejs \
  npm \
  nodejs-legacy \
  python \
  python-setuptools \                                                                                                                                                            
  python-pip \
  python-dev \
  build-essential \
  vim \
  wget \
  libpq-dev \
  file \
  lib32ncurses5-dev \
  libgeos-dev && \
  sh /geolibs.sh


 
CMD ["bash"]
