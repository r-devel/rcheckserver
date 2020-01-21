FROM ubuntu:focal

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8

RUN \
  apt-get update && \
  apt-get -y dist-upgrade && \
  DEBIAN_FRONTEND=noninteractive apt-get -yq install r-base-dev \
  language-pack-en-base cloc curl parallel vim wget debian-keyring

RUN curl "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0xfe6b0f6d941769e0b8ee7c3c3b1c3b572302bcb1" | apt-key add -

# hack for broken lam4-dev
RUN touch /usr/share/man/man3/MPI_Comm_set_name_lam4-dev.3.gz

# install rcheckserver
RUN echo "deb http://statmath.wu.ac.at/AASC/debian testing main non-free" > /etc/apt/sources.list.d/rcheckserver.list && \
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

CMD ["R"]
