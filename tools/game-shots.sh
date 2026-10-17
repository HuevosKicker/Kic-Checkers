#!/usr/bin/env bash
# Takes an English phone screenshot of each named game for the Telegram channel
# (#263): tools/game-shots.sh <outdir> <game-id>...  writes <outdir>/<id>.png.
# Starts its own server (PORT, default 8772) and removes its helper page on exit.
# Exit 0: every shot taken. 1: a shot is missing or empty. 2: cannot test (no
# Chrome, busy port, unknown game).
set -euo pipefail
cd "$(dirname "$0")/.."

OUTDIR="${1:-}"; shift || true
[ -n "$OUTDIR" ] && [ "$#" -gt 0 ] || { echo "Usage: tools/game-shots.sh <outdir> <game-id>..." >&2; exit 2; }
CHROME="${CHROME:-$(command -v google-chrome || command -v chromium || command -v chromium-browser || true)}"
[ -n "$CHROME" ] || { echo "Chrome not found" >&2; exit 2; }
PORT="${PORT:-8772}"
if (exec 3<>"/dev/tcp/127.0.0.1/$PORT") 2>/dev/null; then echo "Port $PORT is busy" >&2; exit 2; fi
for id in "$@"; do
  [ -f "www/games/$id/index.html" ] || { echo "Unknown game: $id" >&2; exit 2; }
done
mkdir -p "$OUTDIR"

# Seeds English, light theme and a seen tutorial, so the picture shows the board
# and not the welcome or the how-to-play card.
cat > www/_tgshot.html <<'HTML'
<!doctype html><meta charset=utf-8><title>shot</title>
<script>
var p = new URLSearchParams(location.search), g = p.get('g');
try {
  localStorage.setItem('chogan.app.welcomeSeen', 'true');
  localStorage.setItem('chogan.' + g + '.tutSeen', 'true');
  localStorage.setItem('chogan.app.settings', JSON.stringify({ lang: 'en', theme: 'light', sfx: false, music: false, haptics: false }));
} catch (e) {}
location.replace('games/' + g + '/index.html');
</script>
HTML

python3 -m http.server "$PORT" -d www --bind 127.0.0.1 >/dev/null 2>&1 &
SRV=$!
PROFILE=$(mktemp -d)
cleanup() { kill "$SRV"; rm -f www/_tgshot.html; rm -rf "$PROFILE"; }
trap cleanup EXIT
sleep 1

for id in "$@"; do
  # One profile per game, so one game's saved state never shows in the next
  rm -rf "$PROFILE"/*
  "$CHROME" --headless --disable-gpu --no-sandbox --hide-scrollbars --no-first-run \
    --user-data-dir="$PROFILE" --virtual-time-budget=8000 \
    --window-size=420,840 --force-device-scale-factor=2 \
    --screenshot="$OUTDIR/$id.png" "http://127.0.0.1:$PORT/_tgshot.html?g=$id" >/dev/null 2>&1
  [ -s "$OUTDIR/$id.png" ] || { echo "No screenshot for $id" >&2; exit 1; }
  echo "  $OUTDIR/$id.png"
done
