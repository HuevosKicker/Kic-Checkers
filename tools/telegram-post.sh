#!/usr/bin/env bash
# Posts a release's English changelog to the Telegram channel (#258).
#
#   tools/telegram-post.sh v0.5.2
#
# Reads the version code from www/version.js at the checked-out commit, so run
# it on the tag being announced. Needs TELEGRAM_BOT_TOKEN in the environment.
# DRY_RUN=1 prints the message and sends nothing.
# Exit 0: posted (or printed). 1: Telegram refused the message. 2: cannot post
# (bad tag, missing changelog or token).
set -euo pipefail

CHANNEL="${TELEGRAM_CHANNEL:-@chogan_games}"
TAG="${1:-}"
VERSION=$(sed -n "s/^self\.APP_VERSION *= *'\([^']*\)'.*/\1/p" www/version.js)
CODE=$(sed -n "s/^self\.APP_VERSION_CODE *= *\([0-9]*\).*/\1/p" www/version.js)

if [ -z "$TAG" ] || [ "$TAG" != "v$VERSION" ]; then
  echo "Tag '$TAG' does not match www/version.js (v$VERSION); check out the tag first." >&2
  exit 2
fi
NOTES="fastlane/metadata/android/en-US/changelogs/$CODE.txt"
if [ ! -s "$NOTES" ]; then
  echo "No English changelog at $NOTES" >&2
  exit 2
fi

# Plain text, no parse_mode: changelog lines may hold characters Markdown or
# HTML would treat as markup, and a rejected post is worse than an unstyled one.
TEXT="Chogan $VERSION is out

$(cat "$NOTES")

Play in the browser: https://choganhq.github.io/chogan/
Android: https://github.com/choganhq/chogan/releases/tag/$TAG
F-Droid (usually a few days later): https://f-droid.org/packages/io.github.choganhq.chogan/"

if [ "${DRY_RUN:-0}" = "1" ]; then
  echo "To $CHANNEL:"
  printf '%s\n' "$TEXT"
  exit 0
fi

if [ -z "${TELEGRAM_BOT_TOKEN:-}" ]; then
  echo "Secret TELEGRAM_BOT_TOKEN is not set. The owner adds it with:" >&2
  echo "  gh secret set TELEGRAM_BOT_TOKEN -R choganhq/chogan" >&2
  exit 2
fi

# The token goes in the URL, so curl must not print it: -s hides progress and
# errors, and the response body carries only Telegram's verdict.
RESPONSE=$(curl -s --max-time 30 "https://api.telegram.org/bot${TELEGRAM_BOT_TOKEN}/sendMessage" \
  --data-urlencode "chat_id=$CHANNEL" \
  --data-urlencode "text=$TEXT" \
  --data-urlencode "disable_web_page_preview=true") || { echo "Could not reach Telegram" >&2; exit 1; }

if printf '%s' "$RESPONSE" | grep -q '"ok":true'; then
  ID=$(printf '%s' "$RESPONSE" | sed -n 's/.*"message_id":\([0-9]*\).*/\1/p')
  echo "Posted to $CHANNEL as message $ID: https://t.me/${CHANNEL#@}/$ID"
else
  echo "Telegram refused the message: $(printf '%s' "$RESPONSE" | sed -n 's/.*"description":"\([^"]*\)".*/\1/p')" >&2
  echo "Check that the bot is an admin of $CHANNEL with permission to post." >&2
  exit 1
fi
