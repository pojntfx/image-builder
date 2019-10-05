#!/bin/bash

KEY_LOOP="true"
while [ $KEY_LOOP == "true" ]; do
    if [ "$IMAGE_EXTENSION" == "qcow2" ]; then
        qemu-img convert -f qcow2 -O raw /disk/$FILE_NAME /disk/$OS_NAME.img
        rm -rf /disk/$FILE_NAME
        KEY_LOOP="false"
    elif [ "$IMAGE_EXTENSION" == "vmdk" ]; then
        qemu-img convert -f vmdk -O raw /disk/$FILE_NAME /disk/$OS_NAME.img
        rm -rf /disk/$FILE_NAME
        KEY_LOOP="false"
    elif [ "$IMAGE_EXTENSION" == "bz2" ]; then
        bunzip2 /disk/$FILE_NAME
        rm -rf /disk/$FILE_NAME
        export FILE_NAME=$(ls -l /disk | grep "^-" | awk '{ print $9 }' | grep -v "$FILE_NAME")
        export IMAGE_EXTENSION=$(echo $FILE_NAME | cut -d"." -f2)
    elif [ "$IMAGE_EXTENSION" == "img" ]; then
        if [ ! -f /disk/$OS_NAME.img ]; then
            mv /disk/$FILE_NAME /disk/$OS_NAME.img
            ls /disk/
        fi
        KEY_LOOP="false"
    else
        KEY_LOOP="false"
    fi
done
