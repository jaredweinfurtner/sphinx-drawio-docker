FROM ubuntu:20.04

LABEL maintainer="jared@weinfurtner.io"

ENV DEBIAN_FRONTEND noninteractive
ENV SPHINX_VERSION=4.0.2
ENV DRAWIO_DESKTOP_VERSION=14.6.13
ENV SPHINX_CONTRIB_DRAWIO_VERSION=0.0.13

WORKDIR /install
ADD requirements.txt /install
ADD make.bat /install
ADD Makefile /install

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
      tex-gyre \
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
RUN pip3 install --no-cache-dir Sphinx==$SPHINX_VERSION

# install drawio
RUN wget --no-check-certificate -O drawio.deb https://github.com/jgraph/drawio-desktop/releases/download/v$DRAWIO_DESKTOP_VERSION/drawio-amd64-$DRAWIO_DESKTOP_VERSION.deb
RUN apt -y install ./drawio.deb
RUN pip3 install git+https://github.com/Modelmat/sphinxcontrib-drawio@$SPHINX_CONTRIB_DRAWIO_VERSION

# add other dependencies
RUN pip3 install -r requirements.txt
