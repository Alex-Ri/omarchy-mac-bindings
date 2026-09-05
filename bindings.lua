-- omarchy-mac-bindings
-- macOS-like keybinding overlay for Omarchy.
-- Source this from ~/.config/hypr/bindings.lua:
--   dofile(os.getenv("HOME") .. "/.config/omarchy-mac-bindings/bindings.lua")
--
-- Super replaces Option/⌘. Only bindings that conflict with Omarchy defaults
-- are unbound first; everything else is additive.

-- ---------------------------------------------------------------------------
-- Helper: send a key chord to the focused surface (window or layer-shell).
-- Mirrors the pattern from Omarchy's clipboard.lua to avoid stuck synthetic
-- key state: down now, up after a short timer.
-- ---------------------------------------------------------------------------
local function send_shortcut_once(mods, key)
  return function()
    hl.dispatch(hl.dsp.send_key_state({ mods = mods, key = key, state = "down" }))
    hl.timer(function()
      hl.dispatch(hl.dsp.send_key_state({ mods = mods, key = key, state = "up" }))
    end, { timeout = 50, type = "oneshot" })
  end
end

-- ---------------------------------------------------------------------------
-- 1. Unbind conflicting Omarchy defaults
-- ---------------------------------------------------------------------------
hl.unbind("SUPER + W")            -- was: Close window
hl.unbind("SUPER + J")            -- was: Toggle window split
hl.unbind("SUPER + O")            -- was: Pop window out (float & pin)
hl.unbind("SUPER + T")            -- was: Toggle floating/tiling
hl.unbind("SUPER + S")            -- was: Toggle scratchpad
hl.unbind("SUPER + G")            -- was: Toggle window grouping
hl.unbind("SUPER + P")            -- was: Pseudo window
hl.unbind("SUPER + L")            -- was: Toggle workspace layout
hl.unbind("SUPER + K")            -- was: Keybindings help
hl.unbind("SUPER + CTRL + Q")     -- was: Calculator

-- ---------------------------------------------------------------------------
-- 2. Mac-style Ctrl sends  (Super + letter → Ctrl + letter)
-- ---------------------------------------------------------------------------
o.bind("SUPER + A", "Select all",       send_shortcut_once("CTRL", "a"))
o.bind("SUPER + B", "Send Ctrl+B",      send_shortcut_once("CTRL", "b"))
o.bind("SUPER + D", "Send Ctrl+D",      send_shortcut_once("CTRL", "d"))
o.bind("SUPER + E", "Send Ctrl+E",      send_shortcut_once("CTRL", "e"))
o.bind("SUPER + G", "Send Ctrl+G",      send_shortcut_once("CTRL", "g"))
o.bind("SUPER + H", "Send Ctrl+H",      send_shortcut_once("CTRL", "h"))
o.bind("SUPER + I", "Send Ctrl+I",      send_shortcut_once("CTRL", "i"))
o.bind("SUPER + J", "Send Ctrl+J",      send_shortcut_once("CTRL", "j"))
o.bind("SUPER + K", "Send Ctrl+K",      send_shortcut_once("CTRL", "k"))
o.bind("SUPER + L", "Send Ctrl+L",      send_shortcut_once("CTRL", "l"))
o.bind("SUPER + M", "Send Ctrl+M",      send_shortcut_once("CTRL", "m"))
o.bind("SUPER + N", "Send Ctrl+N",      send_shortcut_once("CTRL", "n"))
o.bind("SUPER + O", "Send Ctrl+O",      send_shortcut_once("CTRL", "o"))
o.bind("SUPER + P", "Send Ctrl+P",      send_shortcut_once("CTRL", "p"))
o.bind("SUPER + R", "Send Ctrl+R",      send_shortcut_once("CTRL", "r"))
o.bind("SUPER + S", "Send Ctrl+S",      send_shortcut_once("CTRL", "s"))
o.bind("SUPER + T", "Send Ctrl+T",      send_shortcut_once("CTRL", "t"))
o.bind("SUPER + U", "Send Ctrl+U",      send_shortcut_once("CTRL", "u"))
o.bind("SUPER + W", "Send Ctrl+W",      send_shortcut_once("CTRL", "w"))
o.bind("SUPER + Y", "Send Ctrl+Y",      send_shortcut_once("CTRL", "y"))
o.bind("SUPER + Z", "Send Ctrl+Z",      send_shortcut_once("CTRL", "z"))
o.bind("SUPER + SHIFT + Z", "Redo",     send_shortcut_once("CTRL + SHIFT", "z"))

-- ---------------------------------------------------------------------------
-- 3. Mac Option characters  (Alt + key → Option character)
-- ---------------------------------------------------------------------------
o.bind("ALT + L", "At sign (@)",        send_shortcut_once("ALT", "l"))
o.bind("ALT + E", "Euro sign (€)",      send_shortcut_once("ALT", "e"))

-- ---------------------------------------------------------------------------
-- 4. Lock screen  (replaces calculator on Ctrl+Super+Q)
-- ---------------------------------------------------------------------------
o.bind("SUPER + CTRL + Q", "Lock screen", "omarchy-system-lock")
