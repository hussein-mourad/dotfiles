-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
local browser = "firefox"

hl.on("hyprland.start", function()
	-- hl.exec_cmd("waybar & hyprpaper & firefox")
	-- hl.exec_cmd("waybar")
	hl.exec_cmd("ashell")
	hl.exec_cmd("nm-applet")
	hl.exec_cmd("blueman-applet")
	hl.exec_cmd("systemctl --user start hyprpolkitagent") -- authentication
	hl.exec_cmd("systemctl --user start kanata")
	hl.exec_cmd("systemctl --user start mpd")
	hl.exec_cmd("mpd-mpris")
	hl.exec_cmd("swaync") -- notifications
	hl.exec_cmd("hypridle")
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd("hyprsunset")
	hl.exec_cmd("flameshot")
	hl.exec_cmd("wl-clip-persist --clipboard regular")

	hl.exec_cmd("syncthing --no-browser")
	hl.exec_cmd("localsend --hidden")
	hl.exec_cmd("prayer-times")
	hl.exec_cmd("tmux start-server & konsole -p tabtitle=mtmux -e tmux")
	hl.exec_cmd("wl-paste --type text --watch cliphist store -max-items 20")
	hl.exec_cmd("wl-paste --type image --watch cliphist store -max-items 20")
	hl.exec_cmd(browser)
end)
