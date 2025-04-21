#!/bin/sh
cd scripts || exit

echo
echo "Do you want to update images before rebuilding? (y/n) [default: y]: "
read UPDATE_IMAGES
UPDATE_IMAGES=${UPDATE_IMAGES:-y}

if [ "$UPDATE_IMAGES" = "y" ] || [ "$UPDATE_IMAGES" = "Y" ]; then
    echo
    echo "===== Updating images... ====="
    echo

    NGINX_VERSION=$(grep -oP '^NGINX_VERSION=\K.*' .env)
    MINIO_VERSION=$(grep -oP '^MINIO_VERSION=\K.*' .env)

    docker pull "nginx:$NGINX_VERSION"
    docker pull "minio/minio:$MINIO_VERSION"
fi

echo
echo "===== Building and starting containers... ====="
echo

docker compose build --no-cache
docker compose up -d

echo
echo "===== Done! ====="
echo
