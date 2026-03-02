FROM ubuntu:noble

ENV CRAN="https://cloud.r-project.org/bin/linux/ubuntu noble-cran40/"
ENV VIENNA="https://statmath.wu.ac.at/AASC/debian testing main non-free"

ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV DEBIAN_FRONTEND=noninteractive


# hack for broken lam4-dev
RUN mkdir -p /usr/share/man/man3 && \
    touch /usr/share/man/man3/MPI_Comm_set_name_lam4-dev.3.gz

# install r-base and rcheckserver
RUN apt -yq update &&\
    apt -yq dist-upgrade &&\
    apt -yq install apt-transport-https ca-certificates

RUN echo "deb [trusted=yes arch=amd64] ${VIENNA}" > /etc/apt/sources.list.d/vienna.list && \
    echo "deb [trusted=yes] ${CRAN}" > /etc/apt/sources.list.d/cran.list && \
    apt -yq update &&\
    apt -yq install language-pack-en-base cloc curl parallel vim wget r-base-dev &&\
    apt -yq install rcheckserver &&\
    apt clean

# Default cargo on Ubuntu LTS is often too old
# Maybe we can disable this after updating to Ubuntu 26.04
RUN apt -yq install cargo-1.89 &&\
    update-alternatives --force --install /usr/bin/rust rust /usr/lib/rust-1.89 100 --slave /usr/bin/rustc rustc /usr/bin/rustc-1.89 &&\
    update-alternatives --force --install /usr/bin/cargo cargo /usr/bin/cargo-1.89 100

COPY Renviron /etc/R/Renviron.site
COPY Rprofile /etc/R/Rprofile.site

# For outdated r-recommended packages 
RUN R -e "update.packages(ask=FALSE)"

## Set a default user. Available via runtime flag
## Add user to 'staff' group, granting them write privileges to
## /usr/local/lib/R/site.library
## User should also have & own a home directory
RUN useradd docker \
  && mkdir /home/docker \
  && chown docker:docker /home/docker \
  && usermod -a -G staff docker

CMD ["R"]
