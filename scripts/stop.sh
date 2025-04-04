#!/bin/sh
echo "*** Starting... ***"

cd scripts || exit

docker compose -p minio down

echo "*** Started ***"
