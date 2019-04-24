FROM ubuntu:latest

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8

RUN \
  apt-get update && \
  apt-get -y dist-upgrade && \
  apt-get install -y software-properties-common && \
  add-apt-repository -y ppa:marutter/rrutter3.5 && \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get -yq install r-base-dev \
  language-pack-en-base cloc curl parallel vim wget debian-keyring

# load keys
RUN gpg --recv-keys 3B1C3B572302BCB1 && \
    gpg --armor --export 3B1C3B572302BCB1 | apt-key add -

# hack for broken lam4-dev
RUN touch /usr/share/man/man3/MPI_Comm_set_name_lam4-dev.3.gz

# install rcheckserver
RUN echo "deb http://statmath.wu.ac.at/AASC/debian testing main non-free" > /etc/apt/sources.list.d/rcheckserver.list && \
    apt-get -y update && \
    DEBIAN_FRONTEND=noninteractive apt-get -yq install rcheckserver

# ADD entrypoint.sh /entrypoint.sh
# ENTRYPOINT ["/entrypoint.sh"]

CMD ["R"]
