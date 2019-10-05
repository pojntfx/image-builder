#!/bin/bash

# Registry to push the images to
export NAME_REGISTRY="registry.gitlab.com/pojntfx/pojntfx"
# Regular cloud images to build the KubeVirt images from (in img, iso, qcow2, tar, gz or xz format)
export LIST_IMAGES="ubuntu;16.04;https://cloud-images.ubuntu.com/xenial/current/xenial-server-cloudimg-amd64-disk1.img \
	ubuntu;18.04;https://cloud-images.ubuntu.com/bionic/current/bionic-server-cloudimg-amd64.img \
	debian;9;https://cdimage.debian.org/cdimage/cloud/OpenStack/current-9/debian-9-openstack-amd64.qcow2 \
	debian;10;https://cdimage.debian.org/cdimage/cloud/OpenStack/current-10/debian-10-openstack-amd64.qcow2 \
	centos;7;https://cloud.centos.org/centos/7/images/CentOS-7-x86_64-GenericCloud.qcow2 \
	fedora;30;https://ftp.cica.es/fedora/linux/releases/30/Cloud/x86_64/images/Fedora-Cloud-Base-30-1.2.x86_64.qcow2"
