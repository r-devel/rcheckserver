# rcheckserver [![badge](https://images.microbadger.com/badges/image/cran/debian.svg)](https://hub.docker.com/u/cran)

> Docker images with a complete Debian CRAN check server

The CRAN team maintains a [debian meta package](http://statmath.wu.ac.at/AASC/debian) which depends on all packages that are installed on the CRAN check servers. This provides a reproducible 'R CMD check' environment that works for all CRAN packages. 

The CRAN team always uses the [Debian testing](https://packages.debian.org/testing/) branch. This repository also provides an alternative based on the latest Ubuntu (LTS) server.
