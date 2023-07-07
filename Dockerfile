FROM ubuntu:22.04

LABEL version="1.0" description="Yocto builder" maintainer="vacagonzalo@gmail.com"

# Here are the packages needed to build an image on a headless system with a supported Ubuntu or Debian Linux
# distribution:
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y -q \
  build-essential \
  chrpath \
  cpio \
  debianutils \
  diffstat \
  file \
  gawk \
  gcc \
  git \
  iputils-ping \
  libegl1-mesa \
  liblz4-tool \
  libsdl1.2-dev \
  locales \
  mesa-common-dev \
  python3 \
  python3-git \
  python3-jinja2 \
  python3-pexpect \
  python3-pip \
  python3-subunit \
  socat \
  texinfo \
  unzip \
  wget  \
  xz-utils \
  zstd

# Here are the packages needed to build Project documentation manuals:
# RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y -q \
#   inkscape \
#   install \
#   make \
#   pip3 \
#   python3-pip \
#   pyyaml \
#   sphinx \
#   sphinx_rtd_theme \
#   texlive-latex-extra

RUN locale-gen en_US.UTF-8 && update-locale

RUN adduser --disabled-password --gecos '' dev && \
  usermod -aG sudo dev && \
  echo "dev ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

RUN echo "dash dash/sh boolean false" | debconf-set-selections
RUN DEBIAN_FRONTEND=noninteractive dpkg-reconfigure dash

ADD https://storage.googleapis.com/git-repo-downloads/repo /usr/local/bin/
RUN chmod 777 /usr/local/bin/repo

USER dev
ENV HOME /home/dev
ENV LANG en_US.UTF-8

RUN mkdir /home/dev/workspace
WORKDIR /home/dev/workspace

RUN git config --global user.email "dev@yocto-builder.com" && git config --global user.name "Developer"
