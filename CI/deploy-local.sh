#!/usr/bin/env bash
set -e
set -o allexport
source /opt/blog/Mizuki-Blog/.env
set +o allexport

TS=$(date +"$TIME_FORMAT")
RELEASE_DIR="$LOCAL_APP_ROOT/releases/$TS"

echo "===> [Local Deploy] Create $RELEASE_DIR"
mkdir -p "$RELEASE_DIR"

echo "===> [Local Deploy] Sync dist"
rsync -a --delete "$DIST_DIR/" "$RELEASE_DIR/"

echo "===> [Local Deploy] Atomic switch"
ln -sfn "$RELEASE_DIR" "$LOCAL_APP_ROOT/current"

echo "===> [Local Deploy] Cleanup old releases"
ls -1dt "$LOCAL_APP_ROOT/releases/"* | tail -n +$((LOCAL_RELEASE_KEEP + 1)) | xargs -r rm -rf

echo "===> Local deploy done"
