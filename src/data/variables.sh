#!/bin/bash

# Registry to push the images to
export NAME_REGISTRY="docker.io/pojntfx"
# Regular cloud images to build the KubeVirt images from (in img, iso, qcow2, tar, gz or xz format)
export LIST_IMAGES="ubuntu;18.04;https://cloud-images.ubuntu.com/bionic/current/bionic-server-cloudimg-amd64.img \
	debian;10;https://cdimage.debian.org/cdimage/cloud/OpenStack/current-10/debian-10-openstack-amd64.qcow2 \
	centos;7;https://cloud.centos.org/centos/7/images/CentOS-7-x86_64-GenericCloud.qcow2 \
	fedora;31;https://ftp.cica.es/fedora/linux/releases/31/Cloud/x86_64/images/Fedora-Cloud-Base-31-1.9.x86_64.qcow2"
