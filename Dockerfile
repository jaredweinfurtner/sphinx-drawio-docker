FROM ubuntu:20.04

LABEL maintainer="jared@weinfurtner.io"

WORKDIR /install
ADD requirements.txt /install
ADD make.bat /install
ADD Makefile /install

RUN ls -la

ENV DEBIAN_FRONTEND noninteractive

# install drawio support
RUN apt-get update \
 && apt-get install --no-install-recommends -y \
      apt-utils \
      graphviz \
      imagemagick \
      make \
      \
      latexmk \
      lmodern \
      texlive-latex-recommended \
      texlive-latex-extra \
      texlive-fonts-recommended \
      texlive-fonts-extra \
      texlive-lang-cjk \
      texlive-luatex \
      texlive-xetex \
      \
      xvfb \
      wget \
      libgbm1 \
      libasound2 \
      git \
      \
      libgtk-3-0 \
      libnotify4 \
      libnss3 \
      libxss1 \
      libxtst6 \
      libappindicator3-1 \
      libsecret-1-0 \
      python3-pip \
 && apt-get autoremove \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# install sphinx
RUN pip3 install --no-cache-dir -U pip
RUN pip3 install --no-cache-dir Sphinx==3.2.1 Pillow

# install drawio
RUN wget --no-check-certificate -O drawio.deb https://github.com/jgraph/drawio-desktop/releases/download/v13.6.2/draw.io-amd64-13.6.2.deb
RUN apt -y install ./drawio.deb
RUN pip3 install git+https://github.com/Modelmat/sphinxcontrib-drawio@0.0.9

# add other dependencies
RUN pip3 install -r requirements.txt

RUN ls -la