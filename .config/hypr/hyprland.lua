-- Refer to the wiki for more information.
-- https://wiki.hypr.land/Configuring/Start/

-- Load monitors, ignore if it fails
-- monitors.lua is created using nwg-displays
local success = pcall(require, "monitors")
if not success then
	-- Load default monitors config
	require("config.monitors")
end

require("config.autostart")
require("config.env")
require("config.permissions")
require("config.look")
require("config.misc")
require("config.input")
require("config.keybinds")
require("config.workspaces")
