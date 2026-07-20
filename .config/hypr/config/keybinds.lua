---------------------
---- KEYBINDINGS ----
---------------------
local terminal = "konsole"
local fileManager = "pcmanfm"
local menu = "rofi -show combi"
local browser = "firefox"
local lock = "hyprlock --quiet"

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
-- hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("bitwarden-desktop"))
local closeWindowBind = hl.bind(mainMod .. " + Backspace", hl.dsp.window.close())
-- hl.bind(mainMod .. "+ C", hl.dsp.window.close())
hl.bind(mainMod .. "+ SHIFT + Q", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)
hl.bind(
	mainMod .. "+ SHIFT + E",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
-- hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
local clipboardHistory = "cliphist list | rofi -dmenu -display-columns 2 | cliphist decode | wl-copy"
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(clipboardHistory))
hl.bind(mainMod .. " + SHIFT + O", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.window.pseudo())
-- hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit")) -- dwindle only

-- Move focus with mainMod + vim keys
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))

-- Move Windows
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))

-- Move Windows
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move({ direction = "down" }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))

-- Move workspace between monitors
hl.bind(mainMod .. "+ CTRL + comma", hl.dsp.workspace.move({ monitor = "+1" }))
hl.bind(mainMod .. "+ CTRL + period", hl.dsp.workspace.move({ monitor = "-1" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 9 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true }) -- left click
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true }) -- right click
hl.bind(mainMod .. " + mouse:274", hl.dsp.window.close(), { mouse = true }) -- middle click

hl.bind(mainMod .. "+ EQUAL", hl.dsp.exec_cmd("volumectl up"), { locked = true, repeating = true })
hl.bind(mainMod .. "+ MINUS", hl.dsp.exec_cmd("volumectl down"), { locked = true, repeating = true })
hl.bind(mainMod .. "+ 0", hl.dsp.exec_cmd("volumectl toggle"), { locked = true, repeating = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("volumectl up"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("volumectl down"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("volumectl toggle"), { locked = true, repeating = true })
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("pactl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightness up"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightness down"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Screenshot
hl.bind("PRINT", hl.dsp.exec_cmd("flameshot full")) -- fullscreen
hl.bind("CTRL + PRINT", hl.dsp.exec_cmd("flameshot full --clipboard")) -- copy to clipboard only
hl.bind("SHIFT + PRINT", hl.dsp.exec_cmd("flameshot gui")) -- picker

-- Lock Screen
-- hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_cmd(lock))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("swaync-client --toggle-panel --skip-wait"), { release = true })
-- hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("killall -SIGUSR2 waybar")) -- reload config
-- Fullscreen
hl.bind(mainMod .. " + F11", hl.dsp.window.fullscreen({ mode = 0 }))
--
-- Switch to a submap called `resize`.
hl.bind(mainMod .. "+ R", hl.dsp.submap("resize"))

-- Start a submap called "resize".
hl.define_submap("resize", function()
	-- Set repeating binds for resizing the active window.
	-- (LDUR == HJKL) directions
	hl.bind("left", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
	hl.bind("down", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })
	hl.bind("up", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })
	hl.bind("right", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })

	hl.bind("h", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
	hl.bind("j", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })
	hl.bind("k", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })
	hl.bind("l", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })

	-- Use `reset` to go back to the global submap
	hl.bind("escape", hl.dsp.submap("reset"))
end)

hl.bind(mainMod .. "+ Escape", hl.dsp.submap("power menu"))

-- Start a submap called "power menu".
hl.define_submap("power menu", function()
	hl.bind("l", hl.dsp.exec_cmd(lock), { description = "Lock screen" })
	hl.bind("e", hl.dsp.exit(), { description = "Lock screen" })
	hl.bind("s", hl.dsp.exec_cmd("systemctl suspend"))
	hl.bind("h", hl.dsp.exec_cmd("systemctl hibernate"))
	hl.bind("r", hl.dsp.exec_cmd("systemctl reboot"))
	hl.bind("SHIFT + S", hl.dsp.exec_cmd("systemctl poweroff"))

	-- bind = , L, exec, swaylock -f -c 222222, submap, reset
	-- bind = , E, exec, hyprctl dispatch exit, submap, reset
	-- bind = , S, exec, systemctl suspend, submap, reset
	-- bind = , H, exec, systemctl hibernate, submap, reset
	-- bind = , R, exec, systemctl reboot, submap, reset
	-- bind = SHIFT, S, exec, systemctl poweroff, submap, reset

	-- Use `reset` to go back to the global submap
	hl.bind("escape", hl.dsp.submap("reset"))
	hl.bind("return", hl.dsp.submap("reset"))
end)

hl.bind("SUPER + F1", function()
	local game_mode = (hl.get_config("animations.enabled") == false)

	if game_mode then
		hl.exec_cmd("hyprctl reload")
		return
	end

	hl.config({
		general = {
			gaps_in = 0,
			gaps_out = 0, -- Disable gaps
			border_size = 0,
		},

		animations = {
			enabled = false, -- Disable animations
		},

		-- Disable blur, shadow and window rounding
		decoration = {
			shadow = { enabled = false },
			blur = { enabled = false },
			rounding = 0,
		},
	})
end)

hl.bind("SUPER + tab", function()
	local layouts = { "scrolling", "dwindle", "master", "monocle" }
	local workspace = hl.get_active_workspace()
	if hl.get_active_special_workspace() then
		workspace = hl.get_active_special_workspace()
	end

	local next_layout = "dwindle"

	if not workspace then
		return
	end

	for i = 1, #layouts do
		if layouts[i] == workspace.tiled_layout then
			local next_layout_idx = (i % #layouts) + 1
			next_layout = layouts[next_layout_idx]
			break
		end
	end

	if workspace.special then
		hl.workspace_rule({ workspace = tostring(workspace.name), layout = next_layout })
	else
		hl.workspace_rule({ workspace = tostring(workspace.id), layout = next_layout })
	end
end)

-- Keybinds further down will be global again...
