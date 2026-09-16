#!/usr/bin/env bash
# Shows a website in your browser.
#
#   ./preview.sh                 -> shows the only website you have
#   ./preview.sh my-first-website -> shows that one
#
# Press Ctrl+C in this window to stop it.

set -euo pipefail
cd "$(dirname "$0")"

SITES_DIR="websites"

if [ ! -d "$SITES_DIR" ]; then
  echo "No websites yet. Ask Claude to make one!"
  exit 1
fi

# Figure out which website to show.
name="${1:-}"
if [ -z "$name" ]; then
  count=$(find "$SITES_DIR" -mindepth 1 -maxdepth 1 -type d | wc -l | tr -d ' ')
  if [ "$count" -eq 0 ]; then
    echo "No websites yet. Ask Claude to make one!"
    exit 1
  elif [ "$count" -eq 1 ]; then
    name=$(basename "$(find "$SITES_DIR" -mindepth 1 -maxdepth 1 -type d)")
  else
    echo "You have more than one website. Pick one:"
    find "$SITES_DIR" -mindepth 1 -maxdepth 1 -type d -exec basename {} \; | sed 's/^/  .\/preview.sh /'
    exit 1
  fi
fi

target="$SITES_DIR/$name"
if [ ! -d "$target" ]; then
  echo "Can't find a website called '$name'. You have:"
  find "$SITES_DIR" -mindepth 1 -maxdepth 1 -type d -exec basename {} \; | sed 's/^/  /'
  exit 1
fi

# Find a free port, starting at 8000.
port=8000
while [ "$port" -lt 8050 ] && (exec 3<>"/dev/tcp/127.0.0.1/$port") 2>/dev/null; do
  exec 3<&- 2>/dev/null || true
  port=$((port + 1))
done

echo ""
echo "  Your website is running!"
echo ""
echo "      http://localhost:$port"
echo ""
echo "  Click that link to see it. Press Ctrl+C here to stop."
echo ""

exec python3 -m http.server "$port" --directory "$target" --bind 127.0.0.1
