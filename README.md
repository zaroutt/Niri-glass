# Liquid Glass Effect for Niri

<img width="1920" height="1080" alt="Screenshot from 2026-06-25 15-20-23" src="https://github.com/user-attachments/assets/3f0946b6-ddc0-43b2-858d-6cf89b452a0a" />
<img width="1920" height="1080" alt="Screenshot from 2026-06-25 15-20-08" src="https://github.com/user-attachments/assets/b3e1442d-6f4c-4580-9c6a-48bb9ea17dd0" />
## Files


### Shader
- `src/render_helpers/shaders/clipped_surface.frag` - Main liquid glass effect shader (based on [kwin-effects-glass](https://github.com/4v3ngR/kwin-effects-glass))


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

Clone the repo and run the install script:
```bash
git clone https://github.com/your-username/liquid-glass-niri.git
cd liquid-glass-niri
```
```bash
./install.sh /path/to/niri/src
```

If no path is provided, defaults to `~/niri`. The script copies all modified files, recompiles niri, and installs the binary.

### Manual steps
1. Copy files to your niri `src/` directory
2. Run `cargo build --release` in the niri source
3. Copy `target/release/niri` to `/usr/bin/niri` (requires sudo)

## Configuration

In `config.kdl`:
```kdl
window-rule {
    background-effect {
        blur true
        xray true
        liquid-glass {
            refraction-strength 3.0
            power-factor 10
            refraction-power 1.0
        }
    }
}
```
these are the best parameters that i've found. higher refraction strength doenst make look better and the parameters "glow-edge" in my test dont affect anything
- through layer rules it can also effect the bar and dock

## Warnings 
- Vibe coded project so expect weirdly behavior.

