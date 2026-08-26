return {
	mod = "SUPER", -- Sets "Windows" key as main modifier
	terminal = "konsole",
	-- fileManager = "GDK_BACKEND=x11 pcmanfm",
	-- fileManager = "pcmanfm",
	fileManager = "nautilus",
	menu = "rofi -show drun",
	browser = "firefox",
	lock = "hyprlock --quiet --immediate-render",
	passwordManager = "bitwarden-desktop",
	clipboardHistory = "cliphist list | rofi -dmenu -display-columns 2 | cliphist decode | wl-copy",
	audioGUI = "pavucontrol",
	screenshot = {
		full = "hyprshot -m active -m output -z -f screenshot-$(date -u '+%Y%m%dT%H%M%S').png -o ~/Pictures/screenshots",
		window = "hyprshot -m window -z -f screenshot-$(date -u '+%Y%m%dT%H%M%S').png -o ~/Pictures/screenshots",
		region = "hyprshot -m region -z -f screenshot-$(date -u '+%Y%m%dT%H%M%S').png -o ~/Pictures/screenshots",
	},
	calculator = "omacalc",
}
