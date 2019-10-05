# Felicitas Pojtinger's Image Builder

A tool to build KubeVirt disk images. Based on [`Tedezed`'s implementation](https://github.com/Tedezed/kubevirt-images-generator).

## Features

- Generate KubeVirt disk images from `img`, `iso`, `qcow2`, `tar`, `gz` or `xz` images

## Usage

```
# Set the initial user data (optional)
edit src/data/user-data
# Set the registry (required)
source src/data/variables.sh
# Build and push the images
./src/cmd/image-builder.sh
```

## Docs

See [Platform README](../../README.md).
