#!/usr/bin/env bash
set -euo pipefail

# Generate all favicon formats from logo.svg using ImageMagick
# Requires: imagemagick (brew install imagemagick)

if ! command -v magick &> /dev/null; then
    echo "Error: ImageMagick is not installed"
    echo "Install with: brew install imagemagick"
    exit 1
fi

if [ ! -f "logo.svg" ]; then
    echo "Error: logo.svg not found"
    exit 1
fi

echo "Generating favicons from logo.svg..."

# Generate PNG variants for different uses
magick logo.svg -resize 16x16 -background none -flatten favicon-16x16.png
magick logo.svg -resize 32x32 -background none -flatten favicon-32x32.png
magick logo.svg -resize 48x48 -background none -flatten favicon-48x48.png
magick logo.svg -resize 192x192 -background none -flatten icon-192x192.png
magick logo.svg -resize 512x512 -background none -flatten icon-512x512.png
magick logo.svg -resize 180x180 -background none -flatten apple-touch-icon.png

# Generate multi-resolution favicon.ico (contains 16x16, 32x32, 48x48)
magick logo.svg -resize 16x16 -background none -flatten \
       logo.svg -resize 32x32 -background none -flatten \
       logo.svg -resize 48x48 -background none -flatten \
       favicon.ico

echo "✓ Generated favicon.ico (16x16, 32x32, 48x48)"
echo "✓ Generated apple-touch-icon.png (180x180)"
echo "✓ Generated icon-192x192.png (192x192)"
echo "✓ Generated icon-512x512.png (512x512)"
echo ""
echo "Done! Update your HTML to include:"
echo '  <link rel="icon" href="/favicon.ico" sizes="any">'
echo '  <link rel="icon" type="image/svg+xml" href="logo.svg">'
echo '  <link rel="apple-touch-icon" href="/apple-touch-icon.png">'
echo '  <link rel="manifest" href="/manifest.json">'
