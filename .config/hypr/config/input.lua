---------------
---- INPUT ----
---------------

hl.config({
	input = {
		kb_layout = "us,ara",
		kb_variant = ",digits",
		kb_model = "pc105",
		kb_options = "shift:both_capslock_cancel,grp:alt_space_toggle,alt_shift_toggle",
		kb_rules = "",

		follow_mouse = 1,

		sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

		touchpad = {
			natural_scroll = true,
		},
		numlock_by_default = true,
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
	name = "epic-mouse-v1",
	sensitivity = -0.5,
})
