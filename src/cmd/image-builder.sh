#!/bin/bash

# Process all specified images
for IMAGE in $LIST_IMAGES; do
    # Setup env
    OS_NAME=$(echo $IMAGE | cut -d";" -f1)
    OS_VERSION=$(echo $IMAGE | cut -d";" -f2)
    IMAGE_URL=$(echo $IMAGE | cut -d";" -f3)
    URL_LIST=($(echo "$IMAGE_URL" | tr "/" " "))
    FILE_NAME="${URL_LIST[${#URL_LIST[@]} - 1]}"
    NAME_IMAGE="$OS_NAME-kubevirt-container-disk"
    FILE_LIST=($(echo "$FILE_NAME" | tr "." " "))
    IMAGE_NAME=$(echo $FILE_NAME | cut -d"." -f1)
    IMAGE_EXTENSION="${FILE_LIST[${#FILE_LIST[@]} - 1]}"

    # Log info
    echo "[DATA] OS: $OS_NAME"
    echo "[DATA] VERSION: $OS_VERSION"
    echo "[DATA] IMAGE: $IMAGE_URL"

    # Build image
    echo "[INFO] Building $OS_NAME:$OS_VERSION ..."
    docker build -f $(dirname "$0")/../../Dockerfile -t $NAME_REGISTRY/$NAME_IMAGE:$OS_VERSION \
        --build-arg OS_NAME="$OS_NAME" \
        --build-arg OS_VERSION="$OS_VERSION" \
        --build-arg IMAGE_URL="$IMAGE_URL" \
        --build-arg FILE_NAME="$FILE_NAME" \
        --build-arg IMAGE_NAME="$IMAGE_NAME" \
        --build-arg IMAGE_EXTENSION="$IMAGE_EXTENSION" .

    # Push image
    echo "[INFO] Pushing $OS_NAME:$OS_VERSION ..."
    docker push $NAME_REGISTRY/$NAME_IMAGE:$OS_VERSION

    # Delete the local image (so that the disk doesn't fill up)
    docker rmi $NAME_REGISTRY/$NAME_IMAGE:$OS_VERSION
done

# Clean up data
echo "[INFO] Cleaning ..."
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker rmi $(docker images | grep "^<none>" | awk '{ print $3 }')
docker rmi $(docker images | grep "<none>" | grep "$NAME_IMAGE" | awk '{ print $3 }')
