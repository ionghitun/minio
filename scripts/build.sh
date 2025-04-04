#!/bin/sh
echo "*** Rebuild start ***"

cd scripts || exit

# Prompt user for input
echo "Want to update images before rebuild? (y/n) [default: y]: "
read UPDATE_IMAGES
UPDATE_IMAGES=${UPDATE_IMAGES:-y}

# Check user input in a POSIX-compatible way
if [ "$UPDATE_IMAGES" = "y" ] || [ "$UPDATE_IMAGES" = "Y" ]; then
    NGINX_VERSION=$(grep -oP '^NGINX_VERSION=\K.*' .env)
    MINIO_VERSION=$(grep -oP '^MINIO_VERSION=\K.*' .env)

    docker pull "nginx:$NGINX_VERSION"
    docker pull "minio/minio:$MINIO_VERSION"
fi

echo "*** Rebuilding application ***"
docker compose -p minio build --no-cache
docker compose -p minio up -d

echo "*** Rebuild ended ***"
