#!/bin/sh
set -eu

ROOT="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
PROJECT="${1:-"$ROOT/../AINS-Studio-Glasswing-Safari-Xcode"}"

if ! command -v xcrun >/dev/null 2>&1; then
  echo "Install Xcode and its Command Line Tools on macOS, then run this script again." >&2
  exit 1
fi

xcrun safari-web-extension-packager "$ROOT" \
  --project-location "$PROJECT" \
  --app-name "AINS Studio Glasswing" \
  --bundle-identifier "my.gov.moe.ainsstudio.glasswing" \
  --swift

printf '\nXcode project created at: %s\n' "$PROJECT"
printf 'Open it in Xcode to select a signing team, build, and run the Safari extension.\n'
