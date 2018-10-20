FROM debian:testing

RUN \
  apt-get update && \
  apt-get -y dist-upgrade && \
  DEBIAN_FRONTEND=noninteractive apt-get -yq install r-base-dev \
  locales cloc curl parallel vim wget debian-keyring

RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
    && locale-gen en_US.utf8 \
    && /usr/sbin/update-locale LANG=en_US.UTF-8

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8

# load keys
RUN gpg --recv-keys 3B1C3B572302BCB1 && \
    gpg --armor --export 3B1C3B572302BCB1 | apt-key add -

## Use Debian unstable via pinning -- new style via APT::Default-Release
RUN echo "deb http://http.debian.net/debian sid main" > /etc/apt/sources.list.d/debian-unstable.list && \
    echo "deb http://statmath.wu.ac.at/AASC/debian testing main non-free" > /etc/apt/sources.list.d/rcheckserver.list && \
    echo 'APT::Default-Release "testing";' > /etc/apt/apt.conf.d/default && \
    apt-get -y update && \
    DEBIAN_FRONTEND=noninteractive apt-get -yq install rcheckserver

## Set a default user. Available via runtime flag
## Add user to 'staff' group, granting them write privileges to
## /usr/local/lib/R/site.library
## User should also have & own a home directory
RUN useradd docker \
	&& mkdir /home/docker \
	&& chown docker:docker /home/docker \
	&& addgroup docker staff

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

LABEL maintainer "krikava@gmail.com"

CMD ["R"]
