#!/usr/bin/env bash
set -e
set -o allexport
source /opt/blog/Mizuki-Blog/.env
set +o allexport

TS=$(date +"$TIME_FORMAT")
RELEASE_DIR="$VPS_STATIC_ROOT/releases/$TS"

echo "===> [VPS Deploy] Create $RELEASE_DIR"
ssh "$VPS_USER@$VPS_HOST" "mkdir -p '$RELEASE_DIR'"

echo "===> [VPS Deploy] Sync assets"
rsync -az --delete "$DIST_DIR/assets/" \
  "$VPS_USER@$VPS_HOST:$RELEASE_DIR/assets/"

echo "===> [VPS Deploy] Sync pagefind"
rsync -az --delete "$DIST_DIR/pagefind/" \
  "$VPS_USER@$VPS_HOST:$RELEASE_DIR/pagefind/"

echo "===> [VPS Deploy] Atomic switch"
ssh "$VPS_USER@$VPS_HOST" \
  "ln -sfn '$RELEASE_DIR' '$VPS_STATIC_ROOT/current'"

echo "===> [VPS Deploy] Cleanup old releases"
ssh "$VPS_USER@$VPS_HOST" "
ls -1dt '$VPS_STATIC_ROOT/releases/'* | tail -n +$((VPS_RELEASE_KEEP + 1)) | xargs -r rm -rf
"

echo "===> VPS static deploy done"