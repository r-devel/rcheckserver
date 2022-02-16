# rcheckserver [![badge](https://img.shields.io/docker/cloud/build/cran/debian)](https://hub.docker.com/u/cran)

 - Debian: [![debian](https://img.shields.io/docker/image-size/cran/debian/latest)](https://hub.docker.com/repository/docker/cran/debian)
 - Ubuntu: [![ubuntu](https://img.shields.io/docker/image-size/cran/ubuntu/latest)](https://hub.docker.com/repository/docker/cran/ubuntu)

> Docker images with a complete Debian CRAN check server

The CRAN team maintains a [debian meta package](http://statmath.wu.ac.at/AASC/debian) which depends on all packages that are installed on the CRAN Debian check server. This provides a reproducible 'R CMD check' environment for CRAN packages.

## How to use

The CRAN team always uses the [Debian testing](https://packages.debian.org/testing/) distribution, which is also what our Debian images use. This is a rolling branch, which means system libraries get continously updated, and may get breaking changes.

```sh
# Get the latest image
docker pull cran/debian

# Start interactive bash shell
docker run --rm -it cran/debian bash
```

To quickly test if a package can be built:

```sh
docker run --rm -it cran/debian R -e 'install.packages("sf")'
```

Alternatively, we provide a similar environment based on the latest Ubuntu (LTS) server, with the latest R installed from [CRAN](https://cran.r-project.org/bin/linux/ubuntu/). This image is smaller and stable, with slightly older system libraries than Debian, and only non-breaking updates.

## Source code

The files in the [source](source) directory keep track of upstream changes in rcheckserver:

 - [control](source/control): the debian `control` file which formally specifies the dependencies.
 - [changelog](source/changelog): keeps track of what has changed and when
 - [copyright](source/copyright): information from the authors of rcheckserver

We try to automatically update these source files using the [source.yml](.github/workflows/source.yml) action.
