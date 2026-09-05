# omarchy-mac-bindings

macOS-like keybinding overlay for [Omarchy](https://github.com/basecamp/omarchy). Super replaces ⌘/Option; only conflicting defaults are unbound first.

## Installation

```bash
git clone https://github.com/Alex-Ri/omarchy-mac-bindings.git ~/.config/omarchy-mac-bindings
```

Then add this line to `~/.config/hypr/bindings.lua`:

```lua
dofile(os.getenv("HOME") .. "/.config/omarchy-mac-bindings/bindings.lua")
```

## Keybindings at a glance

### Window management (Omarchy defaults, preserved)

| Binding | Action |
|---|---|
| `SUPER + ←↑→↓` | Focus window in direction |
| `SUPER + SHIFT + ←↑→↓` | Swap window in direction |
| `SUPER + ALT + ←↑→↓` | Move window into group |
| `SUPER + 1-9` | Switch to workspace |
| `SUPER + SHIFT + 1-9` | Move window to workspace |
| `SUPER + F` | Fullscreen |
| `SUPER + CTRL + F` | Tiled fullscreen |
| `SUPER + ALT + F` | Full width (maximized) |
| `SUPER + TAB` | Next workspace |
| `SUPER + SHIFT + TAB` | Previous workspace |
| `SUPER + SHIFT + ALT + ←↑→↓` | Move workspace to monitor |
| `SUPER + CTRL + ←↑→↓` | Resize window |

### Mac Ctrl sends (new)

| Binding | Action |
|---|---|
| `SUPER + A` | Select all |
| `SUPER + B` | Send Ctrl+B |
| `SUPER + D` | Send Ctrl+D |
| `SUPER + E` | Send Ctrl+E |
| `SUPER + G` | Send Ctrl+G |
| `SUPER + H` | Send Ctrl+H |
| `SUPER + I` | Send Ctrl+I |
| `SUPER + J` | Send Ctrl+J |
| `SUPER + K` | Send Ctrl+K |
| `SUPER + L` | Send Ctrl+L |
| `SUPER + M` | Send Ctrl+M |
| `SUPER + N` | Send Ctrl+N |
| `SUPER + O` | Send Ctrl+O |
| `SUPER + P` | Send Ctrl+P |
| `SUPER + R` | Send Ctrl+R |
| `SUPER + S` | Send Ctrl+S |
| `SUPER + T` | Send Ctrl+T |
| `SUPER + U` | Send Ctrl+U |
| `SUPER + W` | Send Ctrl+W |
| `SUPER + Y` | Send Ctrl+Y |
| `SUPER + Z` | Send Ctrl+Z |
| `SUPER + SHIFT + Z` | Redo (Ctrl+Shift+Z) |

### Mac Option characters

| Binding | Action |
|---|---|
| `ALT + L` | @ (at sign) |
| `ALT + E` | € (euro sign) |

### Clipboard (Omarchy defaults, preserved)

| Binding | Action |
|---|---|
| `SUPER + C` | Copy |
| `SUPER + V` | Paste |
| `SUPER + X` | Cut |
| `SUPER + CTRL + V` | Clipboard manager |

### System

| Binding | Action |
|---|---|
| `SUPER + CTRL + Q` | Lock screen |
| `SUPER + SPACE` | Omarchy menu |
| `SUPER + RETURN` | Terminal |
| `SUPER + SHIFT + RETURN` | Browser |

## What gets unbound

These Omarchy defaults are replaced by the Ctrl sends above. If you need any of them back, rebind them in your own `bindings.lua` after the `dofile`:

| Unbound binding | Was |
|---|---|
| `SUPER + W` | Close window |
| `SUPER + J` | Toggle window split |
| `SUPER + O` | Pop window out |
| `SUPER + T` | Toggle floating |
| `SUPER + S` | Toggle scratchpad |
| `SUPER + G` | Toggle grouping |
| `SUPER + P` | Pseudo window |
| `SUPER + L` | Toggle workspace layout |
| `SUPER + K` | Keybindings help |
| `SUPER + CTRL + Q` | Calculator |

## How it works

- `send_shortcut_once()` sends a key chord to the focused window using Hyprland's `send_key_state` dispatcher (same pattern as Omarchy's clipboard bindings).
- Only conflicting defaults are unbound; all other Omarchy bindings remain active.
- The overlay is a single Lua file with no dependencies beyond Omarchy's runtime.

## License

MIT
