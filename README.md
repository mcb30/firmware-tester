# Firmware build toolchain container

[![Build](https://img.shields.io/github/workflow/status/mcb30/firmware-tester/Build)](https://github.com/mcb30/firmware-tester/actions?query=workflow%3ABuild+branch%3Amaster)
[![Image](https://img.shields.io/docker/image-size/mcb30/firmware-tester)](https://hub.docker.com/r/mcb30/firmware-tester/)

This is a recipe for building a [Docker](https://www.docker.com/)
container preinstalled with toolchains for various embedded firmware
platforms.

The resulting container is published on Docker Hub as
[`mcb30/firmware-tester`](https://hub.docker.com/r/mcb30/firmware-tester/).

## Building

To build and publish the container image:

    docker build -t mcb30/firmware-tester .
    docker push mcb30/firmware-tester

## Extending

The primary use case for this container image is as a base image for
running automated tests on embedded firmware.  A firmware source tree
may include a `Dockerfile` such as:

    FROM mcb30/firmware-tester
    ADD . /opt/build
    CMD make -C /opt/build test

Tests can then be run (from within the firmware source directory)
using:

    docker build -t my-project-tester .
    docker run -it --rm my-project-tester

These commands can be invoked as part of a continuous integration
system such as [GitHub Actions](https://docs.github.com/actions), to
ensure that the firmware's automated tests are run automatically for
every commit and pull request.
