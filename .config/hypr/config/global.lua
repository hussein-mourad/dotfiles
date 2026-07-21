return {
	mod = "SUPER", -- Sets "Windows" key as main modifier
	terminal = "konsole",
	fileManager = "pcmanfm",
	menu = "rofi -show combi",
	browser = "firefox",
	lock = "hyprlock --quiet",
	passwordManager = "bitwarden-desktop",
	clipboardHistory = "cliphist list | rofi -dmenu -display-columns 2 | cliphist decode | wl-copy",
}
