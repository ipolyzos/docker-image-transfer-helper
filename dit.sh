#!/bin/bash

unset DOCKER_FROM DOCKER_TO DOCKER_IMAGE DOCKER_IMAGE_VERSION

# parse arguments
while (( "$#" )); do
    case "$1" in
    -h|--help)
      echo "dit.sh : Docker Images Transfer (DIT) Helper aim to trasfer/copy docker images between registries."
      echo "Usage: ./dit.sh --from [SOURCE REPO] --to [DEST_REPO] --image [IMAGE] --version [VERSION]"
      echo "options: "
      echo "    -f, --from               Source repository."
      echo "    -t, --to                 Destination repository. "
      echo "    -i, --image              The image to transfer."
      echo "    -v, --version            The version of the image to transfer."
      echo "    -h, --help               Display this help message."
      exit 0
      ;;
    -f | --from)
      DOCKER_FROM=$2
      shift 2
      ;;
    -t|--to)
      DOCKER_TO=$2
      shift 2
      ;;
    -i|--image)
      DOCKER_IMAGE=$2
      shift 2
      ;;
    -v|--version)
      DOCKER_IMAGE_VERSION=$2
      shift  2
      ;;
    *)
      echo "Invalid Option: $1" 1>&2
      echo "use --help or -h for more."
      exit -1
      ;;
  esac
done

# Download original image from the source repo
docker pull ${DOCKER_FROM}/${DOCKER_IMAGE}:${DOCKER_IMAGE_VERSION}
# Tag image for transfer to the destinatio repo
docker tag ${DOCKER_FROM}/${DOCKER_IMAGE}:${DOCKER_IMAGE_VERSION} ${DOCKER_TO}/${DOCKER_IMAGE}:${DOCKER_IMAGE_VERSION}
# Push (upload) to the destination repo
docker push ${DOCKER_TO}/${DOCKER_IMAGE}:${DOCKER_IMAGE_VERSION}