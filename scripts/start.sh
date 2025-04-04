#!/bin/sh
echo "*** Starting... ***"

cd scripts || exit

docker compose -p minio up -d

echo "*** Started ***"
