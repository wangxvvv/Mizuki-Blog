#!/usr/bin/env bash
set -e
set -o allexport
source /opt/blog/Mizuki-Blog/.env
set +o allexport

echo "===> [Build] Repo: $REPO_DIR"
cd "$REPO_DIR"

git fetch origin
git checkout main
git reset --hard origin/main
git clean -fd

pnpm install 
pnpm build

echo "===> Build finished"