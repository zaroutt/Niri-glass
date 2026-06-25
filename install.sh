#!/bin/bash
set -e

NIRI_SRC="${1:-$HOME/niri}"

if [ ! -d "$NIRI_SRC" ]; then
    echo "Error: niri source directory not found at $NIRI_SRC"
    echo "Usage: ./install.sh [path-to-niri-src]"
    exit 1
fi

echo "Copying files to $NIRI_SRC..."
cp src/render_helpers/liquid_glass.rs "$NIRI_SRC/src/render_helpers/"
cp src/render_helpers/shaders/clipped_surface.frag "$NIRI_SRC/src/render_helpers/shaders/"
cp src/render_helpers/background_effect.rs "$NIRI_SRC/src/render_helpers/"
cp src/render_helpers/framebuffer_effect.rs "$NIRI_SRC/src/render_helpers/"
cp src/render_helpers/xray.rs "$NIRI_SRC/src/render_helpers/"
cp src/render_helpers/shaders/mod.rs "$NIRI_SRC/src/render_helpers/shaders/"
cp src/render_helpers/mod.rs "$NIRI_SRC/src/render_helpers/"
cp niri-config/src/appearance.rs "$NIRI_SRC/niri-config/src/"

echo "Building niri..."
cd "$NIRI_SRC" && cargo build --release

echo "Installing niri binary..."
sudo cp "$NIRI_SRC/target/release/niri" /usr/bin/niri

echo "Done! Restart niri to apply."
