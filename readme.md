# rcheckserver [![badge](https://img.shields.io/docker/cloud/build/cran/debian)](https://hub.docker.com/u/cran)

 - Debian: [![debian](https://img.shields.io/docker/image-size/cran/debian/latest)](https://hub.docker.com/repository/docker/cran/debian)
 - Ubuntu: [![ubuntu](https://img.shields.io/docker/image-size/cran/ubuntu/latest)](https://hub.docker.com/repository/docker/cran/ubuntu)

> Docker images with a complete Debian CRAN check server

The CRAN team maintains a [debian meta package](http://statmath.wu.ac.at/AASC/debian) which depends on all packages that are installed on the CRAN Debian check server. This provides a reproducible 'R CMD check' environment that works for any CRAN package. 

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

The CRAN team always uses the [Debian testing](https://packages.debian.org/testing/) distribution, which is also what our Debian images use. This is a rolling branch, which means system libraries get continously updated, and may get breaking changes.

Alternatively, we also provides a similar image based on the latest Ubuntu (LTS) server with the latest R installed from [CRAN](https://cran.r-project.org/bin/linux/ubuntu/). This image is smaller and stable, with slightly older system libraries than Debian, with only non-breaking updates.
