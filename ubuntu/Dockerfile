FROM ubuntu:jammy

RUN \
    apt-get update && \
    apt-get -y dist-upgrade && \
    apt-get install -y apt-utils curl software-properties-common dirmngr && \
    curl https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc && \
    add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/" && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -yq install r-base-dev language-pack-en-base cloc curl parallel vim wget debian-keyring

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8

RUN curl "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0xfe6b0f6d941769e0b8ee7c3c3b1c3b572302bcb1" | APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1 apt-key add -

# hack for broken lam4-dev
RUN touch /usr/share/man/man3/MPI_Comm_set_name_lam4-dev.3.gz

# install rcheckserver
RUN echo "deb http://statmath.wu.ac.at/AASC/debian testing main non-free" > /etc/apt/sources.list.d/rcheckserver.list && \
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

## Set RSPM as the default repo to get precompiled packages
RUN RPROFILE=$(R RHOME)/etc/Rprofile.site && \
    echo 'options(repos = c(CRAN = "https://packagemanager.rstudio.com/all/__linux__/jammy/latest"))' >> "$RPROFILE" && \
    echo 'options(HTTPUserAgent = sprintf("R/%s R (%s)", getRversion(), paste(getRversion(), R.version$platform, R.version$arch, R.version$os)))' >> "$RPROFILE"

CMD ["R"]
