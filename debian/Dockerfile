FROM debian:testing

RUN \
	apt-get update && \
	apt-get -y dist-upgrade && \
	DEBIAN_FRONTEND=noninteractive apt-get -yq install r-base-dev \
	locales cloc curl parallel vim wget debian-keyring git \
	libnode-dev libarchive-dev

RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
	&& locale-gen en_US.utf8 \
	&& /usr/sbin/update-locale LANG=en_US.UTF-8

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8

## This seems broken right now in sid
# RUN gpg --recv-keys 3B1C3B572302BCB1 && \
#    gpg --armor --export 3B1C3B572302BCB1 | apt-key add -

RUN curl "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0xfe6b0f6d941769e0b8ee7c3c3b1c3b572302bcb1" | apt-key add -

# Using buster for pkgs removed from 'testing'
RUN \
	echo "deb http://deb.debian.org/debian buster main" >> /etc/apt/sources.list && \
	echo "deb http://statmath.wu.ac.at/AASC/debian testing main non-free" > /etc/apt/sources.list.d/rcheckserver.list && \
	apt-get -y update && \
	DEBIAN_FRONTEND=noninteractive apt-get -yq install rcheckserver

# ADD entrypoint.sh /entrypoint.sh
# ENTRYPOINT ["/entrypoint.sh"]

## Set a default user. Available via runtime flag
## Add user to 'staff' group, granting them write privileges to
## /usr/local/lib/R/site.library
## User should also have & own a home directory
RUN useradd docker \
	&& mkdir /home/docker \
	&& chown docker:docker /home/docker \
	&& addgroup docker staff

LABEL maintainer "jeroen@berkeley.edu"

CMD ["R"]
