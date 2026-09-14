#!/bin/bash
# Builds the app and prints only what matters: the errors.
# Run with:  ./build.sh
cd "$(dirname "$0")" || exit 1

output=$(xcodebuild \
  -project TjejerKodar.xcodeproj \
  -scheme TjejerKodar \
  -destination 'generic/platform=iOS Simulator' \
  -quiet \
  build 2>&1)
status=$?

if [ $status -eq 0 ]; then
  echo "$output" | grep "warning:" | grep -v "AppIntents"
  echo "** BUILD SUCCEEDED **"
  exit 0
fi

echo "$output" | grep -E "error:" | sort -u
echo "$output" | grep -qE "error:" || echo "$output" | tail -30
echo "** BUILD FAILED **"
exit 1
