# Liquid Glass Effect for Niri

This directory contains only the modified files from niri for the liquid glass effect.

## Files

### Shader
- `src/render_helpers/shaders/clipped_surface.frag` - Main liquid glass effect shader (based on kwin-effects-glass + HyprGlass)

### Rust (rendering)
- `src/render_helpers/liquid_glass.rs` - `LiquidGlassOptions` struct with effect parameters
- `src/render_helpers/background_effect.rs` - Liquid glass integration with background effect
- `src/render_helpers/framebuffer_effect.rs` - Uniform passing to shader (windows)
- `src/render_helpers/xray.rs` - Uniform passing to shader (xray)
- `src/render_helpers/shaders/mod.rs` - Uniform registration during shader compilation
- `src/render_helpers/mod.rs` - Module declaration for liquid_glass

### Config
- `niri-config/src/appearance.rs` - Parsing of `liquid-glass` config in KDL format

### Niri Config
- `config.kdl` - Example configuration with liquid-glass enabled

## How to Apply

1. Copy files to the niri directory:
   ```bash
   cp src/render_helpers/liquid_glass.rs /home/za/niri/src/render_helpers/
   cp src/render_helpers/shaders/clipped_surface.frag /home/za/niri/src/render_helpers/shaders/
   # ... etc
   ```

2. Recompile niri:
   ```bash
   cd /home/za/niri && cargo build --release
   ```

3. Copy the binary:
   ```bash
   sudo cp /home/za/niri/target/release/niri /usr/bin/niri
   ```

## Configuration

In `config.kdl`:
```kdl
window-rule {
    background-effect {
        blur true
        xray true
        liquid-glass {
            refraction-strength 1.0
            power-factor 3.0
            refraction-power 0.6
        }
    }
}
```

## Parameters

| Parameter | Range | Default | Description |
|-----------|-------|---------|-------------|
| `refraction-strength` | 0-100 | 1.0 | Refraction intensity |
| `power-factor` | 1-10 | 3.0 | Lens curvature shape |
| `refraction-power` | 0-100 | 0.6 | Normal scale for refraction |
| `glow-weight` | -100-100 | 0.08 | Edge glow intensity |
| `edge-lighting` | 0-100 | 1.0 | Edge lighting effect |
| `fringing` | 0-100 | 0.3 | Chromatic aberration |
| `lens-distortion` | 0-100 | 0.5 | Center dome magnification |
| `brightness` | 0-100 | 1.0 | Brightness multiplier |
| `contrast` | 0-100 | 1.0 | Contrast adjustment |
| `saturation` | 0-100 | 0.85 | Saturation level |
| `vibrancy` | 0-100 | 0.12 | Selective saturation boost |
