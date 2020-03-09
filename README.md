# Image Builder

A tool to build KubeVirt disk images. Based on [`Tedezed`'s implementation](https://github.com/Tedezed/kubevirt-images-generator).

[![pipeline status](https://gitlab.com/pojntfx/image-builder/badges/master/pipeline.svg)](https://gitlab.com/pojntfx/image-builder/commits/master)

## Overview

Image Builder can generate KubeVirt disk images from `img`, `iso`, `qcow2`, `tar`, `gz` or `xz` images. GitLab CI/CD has been set up to build and push the following images to Docker Hub [every week](https://gitlab.com/pojntfx/image-builder/pipelines):

- [pojntfx/fedora-kubevirt-container-disk](https://hub.docker.com/repository/docker/pojntfx/fedora-kubevirt-container-disk)
- [pojntfx/centos-kubevirt-container-disk](https://hub.docker.com/repository/docker/pojntfx/centos-kubevirt-container-disk)
- [pojntfx/debian-kubevirt-container-disk](https://hub.docker.com/repository/docker/pojntfx/debian-kubevirt-container-disk)
- [pojntfx/ubuntu-kubevirt-container-disk](https://hub.docker.com/repository/docker/pojntfx/ubuntu-kubevirt-container-disk)

## Usage

```zsh
# Set the initial user data (optional)
% edit src/data/user-data
# Set the registry (required)
% source src/data/variables.sh
# Build and push the images
% ./src/cmd/image-builder.sh
```

## License

Image Builder (c) 2020 Felicitas Pojtinger

SPDX-License-Identifier: AGPL-3.0
