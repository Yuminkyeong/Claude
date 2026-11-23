#!/usr/bin/env bash
# Builds docs/index.html (a standalone page for GitHub Pages) from code-letter/index.html.
# Usage: SITE_URL=https://<user>.github.io/<repo>/ ./code-letter/build.sh
set -euo pipefail
cd "$(dirname "$0")/.."
SITE_URL="${SITE_URL:-https://yuminkyeong.github.io/Claude/}"
mkdir -p docs
{
  printf '<!doctype html>\n<html lang="ko">\n<head>\n<meta charset="utf-8">\n'
  printf '<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">\n'
  printf '<meta property="og:type" content="website">\n'
  printf '<meta property="og:title" content="코드 편지가 도착했어요">\n'
  printf '<meta property="og:description" content="열어서 실행하면 코드 한 줄이 그림이 돼요.">\n'
  printf '<meta property="og:image" content="%sog.png">\n' "$SITE_URL"
  printf '<meta name="twitter:card" content="summary_large_image">\n'
  printf '<style>:root{padding-top:env(safe-area-inset-top,0px);padding-bottom:env(safe-area-inset-bottom,0px)}body{margin:0}img{max-width:100%%}</style>\n'
  printf '</head>\n<body>\n'
  cat code-letter/index.html
  printf '\n</body>\n</html>\n'
} > docs/index.html
cp docs/index.html index.html
cp docs/og.png og.png 2>/dev/null || true
echo "built docs/index.html and index.html for $SITE_URL"
