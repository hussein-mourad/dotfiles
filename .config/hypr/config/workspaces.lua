--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },

	move = "20 monitor_h-120",
	float = true,
})

hl.window_rule({
	match = {
		class = ".*pavucontrol.*",
	},
	float = true,
	enabled = false,
})

hl.window_rule({
	match = { title = ".*Calculator.*" },
	float = true,
})

hl.window_rule({
	match = { title = ".*mtmux.*" },
	workspace = "2",
})

hl.window_rule({
	match = { class = "tmuxkitty" },
	workspace = "2",
})

hl.window_rule({
	name = "ueberzug-overlay",
	match = {
		class = "^ueberzugpp_.*",
	},
	float = true,
	no_anim = true,
	fullscreen = false,
	no_initial_focus = true,
	no_focus = true,
	opacity = 1.0, -- Full opacity
	border_size = 0, -- Remove border for cleaner look
	no_dim = true,
	keep_aspect_ratio = true,
	move = {
		"(monitor_w - window_w - (monitor_w * 0.05))", -- 5% from right edge
		"(monitor_h * 0.05)", -- 5% from top edge
	},
	enabled = true,
})

hl.window_rule({
	name = "picture_in_picture",
	match = {
		title = "Picture-in-Picture",
	},
	float = true,
	enabled = true,
})

hl.window_rule({
	match = { class = "omacalc" },
	size = { 400, 500 }, -- Sets a comfortable size
	float = true,
})

hl.window_rule({
	match = { class = "xdg-desktop-portal-*" },
	size = { 800, 600 }, -- Sets a comfortable size
	center = true,
	float = true,
	enabled = true,
})
