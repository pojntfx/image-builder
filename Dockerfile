# Setup env
FROM kubevirt/container-disk-v1alpha:v0.13.6
RUN dnf update -y
RUN dnf install -y findutils

# Setup app
ARG OS_NAME="example_os"
ARG OS_VERSION="0.0"
ARG IMAGE_URL="https://example.com/os_xxx.img"
ARG FILE_NAME="os_xxx.img"
ARG IMAGE_NAME="os_xxx"
ARG IMAGE_EXTENSION="img"
ADD src/data/user-data /mnt/custom/user-data

# Download image
RUN curl -SL $IMAGE_URL -o /disk/$FILE_NAME

# Process image
ADD src/lib/process-img.sh process-img.sh
RUN chmod +x ./process-img.sh
RUN ./process-img.sh
