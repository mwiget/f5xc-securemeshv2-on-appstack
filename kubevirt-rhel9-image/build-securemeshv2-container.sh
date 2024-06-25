#!/bin/bash

# Get KVM qcow2 RHEL image from the official public website https://docs.cloud.f5.com/docs/images
#
URL=$(curl -s https://vesio.blob.core.windows.net/releases/rhel/9/x86_64/images/securemeshV2/securemeshV2.latest)
echo $URL
VER=$(echo $URL | cut -d - -f2)
echo $VER   # e.g. 9.2023.26

REPO="us-west1-docker.pkg.dev/solutions-team-280017/vesio-ver9-ce"
CONTAINER="securemeshv2"
IMAGE=$(basename $URL)
VERSION=$(echo $IMAGE | cut -d- -f2)

echo "IMAGE=$IMAGE VERSION=$VERSION VER=$VER"

if ! test -f $IMAGE; then
  echo downloading $URL ...
  curl -o $IMAGE $URL
else
  echo using local image $IMAGE ...
fi

#echo "resizing image to 50G ... (no longer needed since 2024.10)"
#qemu-img resize $IMAGE 50G

echo ""
echo "building docker container $CONTAINER:$VERSION ..."

docker buildx build --platform linux/amd64 -t $CONTAINER:latest --load .  # cross platform
#docker build -t $CONTAINER:$VERSION .    # native

docker tag $CONTAINER:latest $CONTAINER:$VERSION

echo ""
docker image ls $CONTAINER

echo ""
echo "pushing to $REPO ..."

# remote on gcloud
docker tag $CONTAINER:latest $REPO/$CONTAINER:$VERSION
docker push $REPO/$CONTAINER:$VERSION
