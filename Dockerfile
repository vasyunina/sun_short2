#Copyright (C) 2016 by Ewan Barr
# Licensed under the Academic Free License version 3.0
# This program comes with ABSOLUTELY NO WARRANTY.
# You are free to modify and redistribute this code as long
# as you do not remove the above attribution and reasonably
# inform receipients that you have modified the original work.

FROM ubuntu:16.04

MAINTAINER Ewan Barr "ebarr@mpifr-bonn.mpg.de"

# Suppress debconf warnings
ENV DEBIAN_FRONTEND noninteractive


#Update and upgrade

RUN apt-get -y check && \
    apt-get -y update && \
    apt-get install -y apt-utils apt-transport-https software-properties-common python-software-properties && \
    apt-get -y update --fix-missing && \
    apt-get -y upgrade


# Install dependencies
RUN apt-get --no-install-recommends -y install \
    build-essential \
    autoconf \
    autotools-dev \
    automake \
    pkg-config \
    csh \
    gcc \
    gfortran \
    wget \
    git \
    libcfitsio-dev \
    pgplot5 \
    swig2.0 \
    python \
    python-dev \
    python-pip \
    libfftw3-3 \
    libfftw3-bin \
    libfftw3-dev \
    libfftw3-single3 \
    libx11-dev \
    libpng12-dev \
    libpng3 \
    libpnglite-dev \
    libglib2.0-0 \
    libglib2.0-dev \
    xorg \
    openbox \
    vim \
    python-tk \
    libblas-dev \
    imagemagick \ 
    && rm -rf /var/lib/apt/lists/*

RUN apt-get -y clean

# Install python packages
RUN pip install pip -U && \
    pip install setuptools -U && \
    pip install numpy -U && \
	pip install sunpy -U && \
	pip install requests -U && \
    pip install suds -U && \
    pip install bs4 -U && \
    pip install scipy==0.19.0 -U && \
    pip install matplotlib -U && \
    easy_install scikit-learn==0.12.1 && \
    easy_install theano==0.7 
   

# Define home, psrhome, OSTYPE and create the directory
ENV HOME /home/psr
ENV PSRHOME $HOME/software
ENV OSTYPE linux
RUN mkdir -p $PSRHOME




WORKDIR $HOME 
USER root

