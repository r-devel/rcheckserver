# rcheckserver [![badge](https://img.shields.io/docker/cloud/build/cran/debian)](https://hub.docker.com/u/cran)

 - Debian image: ![debian](https://img.shields.io/docker/image-size/cran/debian/latest)
 - Ubuntu image: ![ubuntu](https://img.shields.io/docker/image-size/cran/ubuntu/latest)

> Docker images with a complete Debian CRAN check server

The CRAN team maintains a [debian meta package](http://statmath.wu.ac.at/AASC/debian) which depends on all packages that are installed on the CRAN check servers. This provides a reproducible 'R CMD check' environment that works for all CRAN packages. 

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

The CRAN team always uses the [Debian testing](https://packages.debian.org/testing/) branch, which is also what our Debian images use.

We also provides an alternative image based on the latest Ubuntu (LTS) server with R backports from [CRAN](https://cran.r-project.org/bin/linux/ubuntu/). This image is smaller and more stable.
