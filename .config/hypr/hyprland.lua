local terminal = "alacritty"
local editor = "env TMUX=false neovide"

-- see uwsm
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

local SYSTEMDVARS = "DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP SSH_AUTH_SOCK SSH_AGENT_PID"

local hostname = io.open("/etc/hostname", "r"):read("*a"):gsub("%s+", "")

-- for n, monitor in pairs(hl.get_monitors()) do
--    hl.notification.create({ text = monitor.description, duration = 5000 })
-- end

-- Unconfigured monitors
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = 1 })

local input_kb, display_lh, display_rh

if hostname == "aslan" then
   input_kb = "keyboardio-model-100-keyboard"
   display_lh, display_rh =
      "desc:ASUSTek COMPUTER INC ASUS VP28U 0x00028572", "desc:ASUSTek COMPUTER INC ASUS VP28U 0x000C0A14"
   hl.monitor({ output = display_lh, mode = "preferred", position = "auto-center-left", scale = "1", transform = 0 })
   hl.monitor({ output = display_rh, mode = "preferred", position = "auto-center-right", scale = "1", transform = 1 })
   -- monitor = DP-1, highres, 0x0, 1, transform, 0
   -- monitor = DP-2, highres, 3840x-1080, 1, transform, 1
elseif hostname == "jaguar" then
   -- monitor = HDMI-A-1, highres, auto-left, 1
   -- monitor = DVI-D-1, highres, auto-right, 1
   -- # monitor = Dell Inc. DELL S2340L 5FYJ532S0H0T, highres, auto-left, 1
   -- # monitor = Dell Inc. DELL S2340L 5FYJ532S1FXT, highres, auto-right, 1
elseif hostname == "kazarka" then
   input_kb = "at-translated-set-2-keyboard"
   -- input_kb = "keyboardio-atreus-keyboard"
   display_lh, display_rh = "desc:BOE NE135A1M-NY1", "desc:BOE NE135A1M-NY1"
   hl.monitor({ output = display_rh, mode = "preferred", position = "auto", scale = "1.333" })
   -- hl.monitor({output = "DP-1", mode = "preferred", position = "auto-center-left", scale = "0.5"})
   -- hl.monitor({output = "DP-2", mode = "preferred", position = "auto-center-left", scale = "0.5"})
   -- hl.monitor({output = "DP-3", mode = "preferred", position = "auto-center-left", scale = "0.5"})
   -- hl.monitor({output = "DP-4", mode = "preferred", position = "auto-center-left", scale = "0.5"})
elseif hostname == "emircik" then
   -- # monitor = eDP-1, highres, auto, 1.333
   -- # monitor = DP-1, highres, auto-left, 0.5
else
   local monitors = hl.get_monitors()
   local display_lh, display_rh = monitors[1].name, monitors[#monitors > 1 and 2 or 1].name
end

-- hl.notification.create({ text = "HOSTNAME " .. hostname, duration = 5000 })
-- hl.notification.create({ text = "KEYBOARD " .. input_kb, duration = 5000 })

hl.workspace_rule({ workspace = "0", monitor = dispaly_rh, layout = "scrolling", default = true })
hl.workspace_rule({ workspace = "1", monitor = display_lh })
hl.workspace_rule({ workspace = "2", monitor = dispaly_rh })
hl.workspace_rule({ workspace = "3", monitor = display_lh })
hl.workspace_rule({ workspace = "4", monitor = dispaly_rh })
hl.workspace_rule({ workspace = "5", monitor = display_lh })
hl.workspace_rule({ workspace = "6", monitor = dispaly_rh })
hl.workspace_rule({ workspace = "7", monitor = display_lh })
hl.workspace_rule({ workspace = "8", monitor = dispaly_rh })
hl.workspace_rule({ workspace = "9", monitor = display_lh, layout = "scrolling" })

hl.bind("SUPER + code:16", hl.dsp.focus({ workspace = "0" }))
hl.bind("SUPER + code:11", hl.dsp.focus({ workspace = "1" }))
hl.bind("SUPER + code:17", hl.dsp.focus({ workspace = "2" }))
hl.bind("SUPER + code:12", hl.dsp.focus({ workspace = "3" }))
hl.bind("SUPER + code:18", hl.dsp.focus({ workspace = "4" }))
hl.bind("SUPER + code:13", hl.dsp.focus({ workspace = "5" }))
hl.bind("SUPER + code:19", hl.dsp.focus({ workspace = "6" }))
hl.bind("SUPER + code:14", hl.dsp.focus({ workspace = "7" }))
hl.bind("SUPER + code:20", hl.dsp.focus({ workspace = "8" }))
hl.bind("SUPER + code:15", hl.dsp.focus({ workspace = "9" }))

hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

hl.bind("SUPER + SHIFT + code:16", hl.dsp.window.move({ workspace = "0" }))
hl.bind("SUPER + SHIFT + code:11", hl.dsp.window.move({ workspace = "1" }))
hl.bind("SUPER + SHIFT + code:17", hl.dsp.window.move({ workspace = "2" }))
hl.bind("SUPER + SHIFT + code:12", hl.dsp.window.move({ workspace = "3" }))
hl.bind("SUPER + SHIFT + code:18", hl.dsp.window.move({ workspace = "4" }))
hl.bind("SUPER + SHIFT + code:13", hl.dsp.window.move({ workspace = "5" }))
hl.bind("SUPER + SHIFT + code:19", hl.dsp.window.move({ workspace = "6" }))
hl.bind("SUPER + SHIFT + code:14", hl.dsp.window.move({ workspace = "7" }))
hl.bind("SUPER + SHIFT + code:20", hl.dsp.window.move({ workspace = "8" }))
hl.bind("SUPER + SHIFT + code:15", hl.dsp.window.move({ workspace = "9" }))

hl.config({
   input = {
      kb_layout = "us,ptf,ru",
      kb_variant = "dvp,,",
      kb_model = "",
      kb_options = "nbsp:level4nl,grp_led:caps,compose:menu,lv3:caps_switch",
      kb_rules = "",
      follow_mouse = 1,
      touchpad = {
         natural_scroll = false,
      },
   },
})

hl.config({
   general = {
      gaps_in = 0,
      gaps_out = 0,
      border_size = 1,
      col = {
         active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
         inactive_border = "rgba(595959aa)",
      },
   },
   decoration = {
      dim_special = 0.8,
   },
   animations = {},
})

hl.on("hyprland.start", function ()
   hl.exec_cmd("fw13-­keymaps")

   hl.exec_cmd("keychain --agents gpg,ssh --ignore-missing --inherit any --systemd --quiet")
   hl.exec_cmd(("systemctl --user import-environment %s").format(SYSTEMDVARS))
   hl.exec_cmd(("dbus-update-activation-environment --systemd %s").format(SYSTEMDVARS))
   hl.exec_cmd("systemctl --user start xdg-desktop-portal-hyprland") -- TODO: now automatic?

   hl.exec_cmd("exec-once = hypridle")
   hl.exec_cmd("hyprpaper")
   hl.exec_cmd("powermate -d")
   hl.exec_cmd("keepassxc")
   hl.exec_cmd("wl-paste --watch cliphist store")

   hl.exec_cmd("dbus-update-activation-environment --systemd --all")
   hl.exec_cmd("systemctl --user start hyprland-session.target")
end)

hl.config({
   misc = {
      always_follow_on_dnd = false,
      disable_hyprland_logo = true,
      disable_splash_rendering = true,
      force_default_wallpaper = 0,
      mouse_move_focuses_monitor = false,
   },
})

hl.config({
   ecosystem = {
      no_update_news = true,
      no_donation_nag = true,
   },
})

hl.config({
   dwindle = {
      preserve_split = true,
   },
})

hl.config({
   scrolling = {
      fullscreen_on_one_column = true,
   },
})

hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "slidevert" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })

hl.bind("SUPER + E", hl.dsp.exec_cmd(("hyprctl switchxkblayout %s 0"):format(input_kb)))
hl.bind("SUPER + U", hl.dsp.exec_cmd(("hyprctl switchxkblayout %s 1"):format(input_kb)))
hl.bind("SUPER + I", hl.dsp.exec_cmd(("hyprctl switchxkblayout %s 2"):format(input_kb)))

hl.bind("SUPER + H", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + L", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + K", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + J", hl.dsp.focus({ direction = "down" }))

hl.bind("SUPER + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind("SUPER + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
hl.bind("SUPER + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind("SUPER + SHIFT + J", hl.dsp.window.move({ direction = "down" }))

hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.gesture({ fingers = 3, direction = "vertical", action = "workspace" })

hl.bind("SUPER + CONTROL + H", hl.dsp.focus({ monitor = "left" }))
hl.bind("SUPER + CONTROL + L", hl.dsp.focus({ monitor = "right" }))

hl.bind("SUPER + Return", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + SHIFT + Return", hl.dsp.exec_cmd(("env TMUX=false %s"):format(terminal)))
hl.bind("SUPER + A", hl.dsp.exec_cmd(editor))

hl.bind("SUPER + R", hl.dsp.exec_cmd("rofi -show drun"))
hl.bind("SUPER + SHIFT + R", hl.dsp.exec_cmd("env TMUX=false rofi -show drun"))
hl.bind("SUPER + S", hl.dsp.exec_cmd("rofi -show ssh"))
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("env TMUX=false rofi -show ssh"))
hl.bind("SUPER + Semicolon", hl.dsp.exec_cmd("rofi -show window"))
hl.bind("SUPER + P", hl.dsp.exec_cmd("rofi -modi clipboard:~/bin/cliphist-rofi -show clipboard"))

hl.bind("SUPER + Q", hl.dsp.window.close())
hl.bind("SUPER + SHIFT + Q", hl.dsp.exec_cmd("hyprshutdown"))
hl.bind("SUPER + G", hl.dsp.window.float({ toggle = true }))
hl.bind("SUPER + F", hl.dsp.window.fullscreen({ toggle = true }))
hl.bind("SUPER + SHIFT + X", hl.dsp.exec_cmd("dms ipc call powermenu toggle"))

hl.bind("Insert", hl.dsp.workspace.toggle_special("hyprake"))

hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
hl.bind(
   "XF86AudioRaiseVolume",
   hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 3%+"),
   -- hl.dsp.exec_cmd("dms ipc call audio increment 3"),
   { locked = true, repeating = true }
)
hl.bind(
   "XF86AudioLowerVolume",
   hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 3%-"),
   -- hl.dsp.exec_cmd("dms ipc call audio decrement 3"),
   { locked = true, repeating = true }
)
hl.bind(
   "XF86AudioMute",
   hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
   -- hl.dsp.exec_cmd("dms ipc call audio mute"),
   { locked = true, repeating = true }
)
hl.bind(
   "XF86AudioMicMute",
   hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
   -- hl.dsp.exec_cmd("dms ipc call audio micmute"),
   { locked = true, repeating = true }
)
hl.bind(
   "XF86MonBrightnessUp",
   -- hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 2%+"),
   hl.dsp.exec_cmd("dms ipc call brightness increment 5"),
   { locked = true, repeating = true }
)
hl.bind(
   "XF86MonBrightnessDown",
   -- hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 2%-"),
   hl.dsp.exec_cmd("dms ipc call brightness increment 3"),
   { locked = true, repeating = true }
)

hl.workspace_rule({
   workspace = "special:hyprake",
   gaps_in = 25,
   gaps_out = 50,
   on_created_empty = "env tmux_session=hyprake alacritty --class hyprake",
})

hl.window_rule({
   name = "suppress-maximize-events",
   match = { class = ".*" },
   suppress_event = "maximize",
})

hl.workspace_rule({ workspace = "w[tv1]s[false]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]s[false]", gaps_out = 0, gaps_in = 0 })
hl.window_rule({ match = { float = false, workspace = "w[tv1]s[false]" }, border_size = 0 })
hl.window_rule({ match = { float = false, workspace = "w[tv1]s[false]" }, rounding = 0 })
hl.window_rule({ match = { float = false, workspace = "f[1]s[false]" }, border_size = 0 })
hl.window_rule({ match = { float = false, workspace = "f[1]s[false]" }, rounding = 0 })

hl.window_rule({
   match = { class = "(pinentry-)(.*)" },
   stay_focused = true,
})

local keepassxc = hl.window_rule({
   name = "keypassxc",
   match = {
      class = "KeePassXC",
      modal = false,
   },
   float = true,
   size = { "(monitor_w*0.6)", "(monitor_h*0.8)" },
   center = true,
   pin = true,
   stay_focused = true,
   no_screen_share = true,
   border_size = 6,
   border_color = "rgba(FF000099)",
   rounding = 6,
})

local keepassxc_modal = hl.window_rule({
   name = "keypassxc-modal",
   match = {
      class = "KeePassXC",
      modal = true,
   },
   float = true,
   size = { "(monitor_w*0.4)", "(monitor_h*0.4)" },
   center = true,
   pin = true,
   stay_focused = true,
   no_screen_share = true,
   border_size = 6,
   border_color = "rgba(FF000099)",
   rounding = 6,
})
