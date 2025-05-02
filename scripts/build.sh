#!/bin/sh
cd scripts || exit

echo
printf "Do you want to update images before rebuilding? (y/n) [default: y]: "
read UPDATE_IMAGES
UPDATE_IMAGES=${UPDATE_IMAGES:-y}

if [ "$UPDATE_IMAGES" = "y" ] || [ "$UPDATE_IMAGES" = "Y" ]; then
    echo
    echo "===== Updating images... ====="
    echo

    NGINX_VERSION=$(sed -n 's/^NGINX_VERSION=//p' .env)
    MINIO_VERSION=$(sed -n 's/^MINIO_VERSION=//p' .env)

    docker pull "nginx:$NGINX_VERSION"
    docker pull "minio/minio:$MINIO_VERSION"
fi

echo
echo "===== Building and starting containers... ====="
echo

if command -v docker-compose >/dev/null 2>&1; then
    docker-compose build --no-cache
    docker-compose up -d
else
    docker compose build --no-cache
    docker compose up -d
fi

echo
echo "===== Done! ====="
echo
