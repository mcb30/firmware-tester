# Firmware build toolchain container

[![Build Status](https://travis-ci.org/unipartdigital/firmware-tester.svg?branch=master)](https://travis-ci.org/unipartdigital/firmware-tester)

This is a recipe for building a [Docker](https://www.docker.com/)
container preinstalled with toolchains for various embedded firmware
platforms.

The resulting container is published on Docker Hub as
[`unipartdigital/firmware-tester`](https://hub.docker.com/r/unipartdigital/firmware-tester/).

## Building

To build and publish the container image:

    docker build -t unipartdigital/firmware-tester .
    docker push unipartdigital/firmware-tester

## Extending

The primary use case for this container image is as a base image for
running automated tests on embedded firmware.  A firmware source tree
may include a `Dockerfile` such as:

    FROM unipartdigital/firmware-tester
    ADD . /opt/build
    CMD make -C /opt/build test

Tests can then be run (from within the firmware source directory)
using:

    docker build -t my-project-tester .
    docker run -it --rm my-project-tester

These commands can be invoked as part of a continuous integration
system such as [Travis CI](https://travis-ci.org/), to ensure that the
firmware's automated tests are run automatically for every commit and
pull request.
