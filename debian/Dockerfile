FROM debian:sid

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

# load keys
RUN gpg --recv-keys 3B1C3B572302BCB1 && \
    gpg --armor --export 3B1C3B572302BCB1 | apt-key add -

RUN echo "deb http://statmath.wu.ac.at/AASC/debian testing main non-free" > /etc/apt/sources.list.d/rcheckserver.list && \
    apt-get -y update && \
    DEBIAN_FRONTEND=noninteractive apt-get -yq install rcheckserver

# ADD entrypoint.sh /entrypoint.sh
# ENTRYPOINT ["/entrypoint.sh"]

LABEL maintainer "jeroen@berkeley.edu"

CMD ["R"]
