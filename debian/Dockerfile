FROM debian:testing

RUN \
	apt-get update && \
	apt-get -y dist-upgrade && \
	DEBIAN_FRONTEND=noninteractive apt-get -yq install r-base-dev \
	locales cloc curl parallel vim wget debian-keyring git \
	libnode-dev libarchive-dev &&\
	apt-get clean

RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
	&& locale-gen en_US.utf8 \
	&& /usr/sbin/update-locale LANG=en_US.UTF-8

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8

RUN \
	echo "deb [trusted=yes arch=amd64,arm64] http://statmath.wu.ac.at/AASC/debian testing main non-free" > /etc/apt/sources.list.d/rcheckserver.list && \
	apt-get -y update && \
	DEBIAN_FRONTEND=noninteractive apt-get -yq install rcheckserver &&\
	apt-get clean

# ADD entrypoint.sh /entrypoint.sh
# ENTRYPOINT ["/entrypoint.sh"]

## Set a default user. Available via runtime flag
## Add user to 'staff' group, granting them write privileges to
## /usr/local/lib/R/site.library
## User should also have & own a home directory
RUN useradd docker \
	&& mkdir /home/docker \
	&& chown docker:docker /home/docker \
	&& usermod -a -G staff docker

LABEL maintainer "jeroen@berkeley.edu"

CMD ["R"]
