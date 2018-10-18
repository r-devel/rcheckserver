FROM r-base:latest

RUN apt-get -y update && \
    DEBIAN_FRONTEND=noninteractive apt-get -yq install \
    cloc \
    curl \
    parallel \
    vim \
    wget \
    debian-keyring

# load keys
RUN gpg --keyserver https://keyserver.ubuntu.com --recv-keys 3B1C3B572302BCB1 && \
    gpg --armor --export 3B1C3B572302BCB1 | apt-key add -

# install rcheckserver
RUN echo "deb http://statmath.wu.ac.at/AASC/debian testing main non-free" > /etc/apt/sources.list.d/rcheckserver.list && \
    apt-get -y update && \
    DEBIAN_FRONTEND=noninteractive apt-get -yq install rcheckserver

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

LABEL maintainer "krikava@gmail.com"

CMD ["R"]
