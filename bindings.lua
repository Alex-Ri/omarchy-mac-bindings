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
hl.unbind("SUPER + CTRL + Q")     -- was: Calculator
hl.unbind("SUPER + CTRL + L")     -- was: Lock system (use SUPER + CTRL + Q instead)
hl.unbind("SUPER + SHIFT + C")    -- was: Calendar → forwarded to Ctrl+Shift+C below
hl.unbind("ALT + TAB")              -- was: double-bound in default (cycle_next + bring_to_top)
hl.unbind("ALT + SHIFT + TAB")      -- same conflict
hl.unbind("SUPER + F")            -- was: Fullscreen
hl.unbind("SUPER + SHIFT + LEFT") -- was: Swap window left
hl.unbind("SUPER + SHIFT + RIGHT") -- was: Swap window right
hl.unbind("SUPER + SHIFT + UP")    -- was: Swap window up
hl.unbind("SUPER + SHIFT + DOWN")  -- was: Swap window down
hl.unbind("SUPER + CTRL + LEFT")   -- was: Group focus left
hl.unbind("SUPER + CTRL + RIGHT")  -- was: Group focus right
hl.unbind("SUPER + ALT + LEFT")    -- was: Move window to group on left
hl.unbind("SUPER + ALT + RIGHT")   -- was: Move window to group on right
hl.unbind("SUPER + ALT + UP")      -- was: Move window to group on top
hl.unbind("SUPER + ALT + DOWN")    -- was: Move window to group on bottom
hl.unbind("SUPER + code:20")       -- was: Expand window left (brackets)
hl.unbind("SUPER + code:21")       -- was: Shrink window left (brackets)
hl.unbind("SUPER + SHIFT + code:20")       -- was: Shrink window up (brackets)
hl.unbind("SUPER + SHIFT + code:21")       -- was: Expand window down (brackets)
hl.unbind("SUPER + ALT + code:20")         -- was: Expand window left a little
hl.unbind("SUPER + ALT + code:21")         -- was: Shrink window left a little
hl.unbind("SUPER + SHIFT + ALT + code:20") -- was: Shrink window up a little
hl.unbind("SUPER + SHIFT + ALT + code:21") -- was: Expand window down a little
hl.unbind("SUPER + CTRL + code:20")        -- was: Expand window left a lot
hl.unbind("SUPER + CTRL + code:21")        -- was: Shrink window left a lot
hl.unbind("SUPER + CTRL + SHIFT + code:20") -- was: Shrink window up a lot
hl.unbind("SUPER + CTRL + SHIFT + code:21") -- was: Expand window down a lot

-- ---------------------------------------------------------------------------
-- 2. Mac-style Ctrl sends  (Super + letter → Ctrl + letter)
-- ---------------------------------------------------------------------------
o.bind("SUPER + A", "Select all",       send_shortcut_once("CTRL", "a"))
o.bind("SUPER + B", "Send Ctrl+B",      send_shortcut_once("CTRL", "b"))
o.bind("SUPER + D", "Send Ctrl+D",      send_shortcut_once("CTRL", "d"))
o.bind("SUPER + E", "Files",             "nautilus")
o.bind("SUPER + F", "Send Ctrl+F",      send_shortcut_once("CTRL", "f"))
o.bind("SUPER + G", "Send Ctrl+G",      send_shortcut_once("CTRL", "g"))
o.bind("SUPER + H", "Send Ctrl+H",      send_shortcut_once("CTRL", "h"))
o.bind("SUPER + I", "Send Ctrl+I",      send_shortcut_once("CTRL", "i"))
o.bind("SUPER + J", "Send Ctrl+J",      send_shortcut_once("CTRL", "j"))
o.bind("SUPER + K", "Keybindings",       "omarchy-menu-keybindings")
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
o.bind("SUPER + SHIFT + C", "Copy",     send_shortcut_once("CTRL + SHIFT", "c"))
o.bind("SUPER + SHIFT + R", "Force reload", "wtype -M ctrl -M shift -k r")

-- ---------------------------------------------------------------------------
-- 3. Mac Option characters  (Alt + key → Option character)
-- ---------------------------------------------------------------------------
-- On this keyboard AltGr is not usable (right Alt sends Super), so type @ and €
-- directly with wtype instead of relying on the German layout's AltGr+Q / AltGr+E.
o.bind("ALT + L", "At sign (@)",        "wtype '@'")
o.bind("ALT + E", "Euro sign (€)",      "wtype '€'")
o.bind("ALT + F", "Fullscreen",         hl.dsp.window.fullscreen({ mode = "fullscreen" }))

-- ---------------------------------------------------------------------------
-- 3a. Alt+Tab cycling  (unbound default's bring_to_top override above)
-- ---------------------------------------------------------------------------
o.bind("ALT + TAB", "Focus on next window",    hl.dsp.window.cycle_next())
o.bind("ALT + SHIFT + TAB", "Focus on previous window", hl.dsp.window.cycle_next({ next = false }))

-- ---------------------------------------------------------------------------
-- Word navigation (Ctrl+arrows → jump by word; Ctrl+Shift+arrows → select by word)
o.bind("CTRL + LEFT", "Jump to previous word",           send_shortcut_once("CTRL", "Left"))
o.bind("CTRL + RIGHT", "Jump to next word",              send_shortcut_once("CTRL", "Right"))
o.bind("CTRL + UP", "Jump to previous paragraph",        send_shortcut_once("CTRL", "Up"))
o.bind("CTRL + DOWN", "Jump to next paragraph",          send_shortcut_once("CTRL", "Down"))
o.bind("CTRL + SHIFT + LEFT", "Select previous word",    send_shortcut_once("CTRL + SHIFT", "Left"))
o.bind("CTRL + SHIFT + RIGHT", "Select next word",       send_shortcut_once("CTRL + SHIFT", "Right"))
o.bind("CTRL + SHIFT + UP", "Select previous paragraph", send_shortcut_once("CTRL + SHIFT", "Up"))
o.bind("CTRL + SHIFT + DOWN", "Select next paragraph",   send_shortcut_once("CTRL + SHIFT", "Down"))

-- Line navigation (Alt+arrows → jump by line; Alt+Shift+arrows → select by line)
o.bind("ALT + LEFT", "Jump to line start",        send_shortcut_once("", "Home"))
o.bind("ALT + RIGHT", "Jump to line end",         send_shortcut_once("", "End"))
o.bind("ALT + UP", "Jump to doc start",           send_shortcut_once("CTRL", "Home"))
o.bind("ALT + DOWN", "Jump to doc end",           send_shortcut_once("CTRL", "End"))
o.bind("ALT + SHIFT + LEFT", "Select to line start", send_shortcut_once("SHIFT", "Home"))
o.bind("ALT + SHIFT + RIGHT", "Select to line end",  send_shortcut_once("SHIFT", "End"))
o.bind("ALT + SHIFT + UP", "Select to doc start",    send_shortcut_once("CTRL + SHIFT", "Home"))
o.bind("ALT + SHIFT + DOWN", "Select to doc end",    send_shortcut_once("CTRL + SHIFT", "End"))

-- ---------------------------------------------------------------------------
-- 3c. Window swap (moved here from Super+Shift to free it for selection)
-- ---------------------------------------------------------------------------
o.bind("SUPER + CTRL + LEFT", "Swap window left",  hl.dsp.window.swap({ direction = "l" }))
o.bind("SUPER + CTRL + RIGHT", "Swap window right", hl.dsp.window.swap({ direction = "r" }))
o.bind("SUPER + CTRL + UP", "Swap window up",    hl.dsp.window.swap({ direction = "u" }))
o.bind("SUPER + CTRL + DOWN", "Swap window down",  hl.dsp.window.swap({ direction = "d" }))

-- ---------------------------------------------------------------------------
-- 4. Lock screen  (replaces calculator on Ctrl+Super+Q)
-- ---------------------------------------------------------------------------
o.bind("SUPER + CTRL + Q", "Lock screen", "omarchy-system-lock")
o.bind("SUPER + Q", "Close window", hl.dsp.window.close())

-- Resize window (mac Rectangle convention: Cmd+Option+arrows)
-- Repeating so holding the key keeps resizing.
o.bind("SUPER + ALT + LEFT",  "Shrink window left",   hl.dsp.window.resize({ x = -80, y = 0, relative = true }), { repeating = true })
o.bind("SUPER + ALT + RIGHT", "Expand window right",  hl.dsp.window.resize({ x = 80, y = 0, relative = true }), { repeating = true })
o.bind("SUPER + ALT + UP",    "Shrink window up",     hl.dsp.window.resize({ x = 0, y = -80, relative = true }), { repeating = true })
o.bind("SUPER + ALT + DOWN",  "Expand window down",   hl.dsp.window.resize({ x = 0, y = 80, relative = true }), { repeating = true })
