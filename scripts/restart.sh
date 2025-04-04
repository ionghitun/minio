#!/bin/sh
echo "*** Restarting... ***"

cd scripts || exit

docker compose -p minio restart

echo "*** Restarted ***"
