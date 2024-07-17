#!/usr/bin/env bash

# https://gist.github.com/jmrf/4de7a72c0c7a07afcb0b5f880dc9a2dc

set -e
set -o pipefail


# Some useful commands to figure out what to tweak:
# https://askubuntu.com/questions/971067/how-can-i-script-the-settings-made-by-gnome-tweak-tool#971577
# * watch dconf changes being made:
#   'dconf watch /'
# * List gsettings keys:
#   'gsettings list-keys org.gnome....'

# https://stackoverflow.com/questions/41156442/glib-gio-message-using-the-memory-gsettings-backend-happened-in-ubuntu-16-10
export GIO_EXTRA_MODULES=/usr/lib/x86_64-linux-gnu/gio/modules/

# Gnome Terminal themes
# Avaialable at: http://mayccoll.github.io/Gogh/ (https://github.com/Mayccoll/Gogh)
# After installing or creating the desired terminal themes;
# 1. Retrieve the ID: `dconf dump /org/gnome/terminal/legacy/profiles:/ | awk '/\[:/||/visible-name=/'`
# 2. Set which one to use for Dark and Light mode.
TERMINAL_LIGHT=cbe9eff5-e0d6-4d58-9a68-655f22f54fa6 # Light theme
TERMINAL_DARK=b689a5ed-7088-4ddd-aea2-b8adee6a5dd9 # Dark theme

# GTK3 Themes
# MacOS 11: https://www.pling.com/p/1220826
# MacOS Sierra: https://www.pling.com/p/1013714
# MacOS Mojave: https://www.pling.com/p/1275087
# MacOS WhiteSur: https://github.com/vinceliuice/WhiteSur-gtk-theme
# For a complete article on the topic: https://itsfoss.com/make-ubuntu-look-like-macos/
# NOTE: Themes should be installed first. i.e.: Copied to ~/.themes
GTK_LIGHT='Yaru-light'   # Or  'macOS11-GTK'
GTK_DARK='Yaru-dark'     # Or 'Mojave-dark'

ICON_THEME="Yaru"

# Similar to the above but for the Gnome Shell (i.e.: top desktop bar, ...)
SHELL_LIGHT='WhiteSur-light-solid'
SHELL_DARK='WhiteSur-dark-solid'

LIGHT_WALLPAPER='file:////usr/share/backgrounds/Focal-Fossa_WP_4096x2304_GREY.png'
DARK_WALLPAPER='file:////usr/share/backgrounds/warty-final-ubuntu.png'

say() {
 echo "$@" | sed \
         -e "s/\(\(@\(red\|green\|yellow\|blue\|magenta\|cyan\|white\|reset\|b\|u\)\)\+\)[[]\{2\}\(.*\)[]]\{2\}/\1\4@reset/g" \
         -e "s/@red/$(tput setaf 1)/g" \
         -e "s/@green/$(tput setaf 2)/g" \
         -e "s/@yellow/$(tput setaf 3)/g" \
         -e "s/@blue/$(tput setaf 4)/g" \
         -e "s/@magenta/$(tput setaf 5)/g" \
         -e "s/@cyan/$(tput setaf 6)/g" \
         -e "s/@white/$(tput setaf 7)/g" \
         -e "s/@reset/$(tput sgr0)/g" \
         -e "s/@b/$(tput bold)/g" \
         -e "s/@u/$(tput sgr 0 1)/g"
}

# =============================================
# ================ Gnome Shell ================
set-shell-theme() {
    theme=$1
    say @blue[["Setting SHELL theme to: @b$theme"]]
    # gsettings doesn't have a scheme for this, so we use dconf directly
    dconf write /org/gnome/shell/extensions/user-theme/name "'$theme'"
}

get-shell-theme() {
    echo $(gsettings get org.gnome.shell.extensions.user-theme name)
}

# =============================================
# ================ GTK Theme ==================

set-gtk-theme() {
    theme=$1
    say @blue[["Setting GTK theme to: @b $theme"]]
    gsettings set org.gnome.desktop.interface gtk-theme $theme
}

get-gtk-theme() {
    echo $(gsettings get org.gnome.desktop.interface gtk-theme)
}

# =============================================
# ================ Terminal ===================
set-terminal-profile() {
    theme=$1
    say @blue[["Setting TERMINAL theme to: @b$theme"]]
    gsettings set org.gnome.Terminal.ProfilesList default $theme
}

get-terminal-profile() {
    # dconf dump /org/gnome/terminal/legacy/profiles:/ | awk '/\[:/||/visible-name=/'
    echo $(gsettings get org.gnome.Terminal.ProfilesList default)
}

set-light() {
    set-gtk-theme $GTK_LIGHT
    set-shell-theme $SHELL_LIGHT
    set-terminal-profile $TERMINAL_LIGHT
    gsettings set org.gnome.desktop.background picture-uri $LIGHT_WALLPAPER
    sed -i 's/dark/light/' ~/.SpaceVim.d/init.toml
}

set-dark() {
    set-gtk-theme $GTK_DARK
    set-shell-theme $SHELL_DARK
    set-terminal-profile $TERMINAL_DARK
    gsettings set org.gnome.desktop.background picture-uri $DARK_WALLPAPER
    sed -i 's/light/dark/' ~/.SpaceVim.d/init.toml
}

toggle-theme() {
    current_gtk_theme=$(get-gtk-theme)
    say @blue[["Current theme: @b@magenta $current_gtk_theme" ]]

    if [ $current_gtk_theme == "'$GTK_LIGHT'" ];
    then
        say @blue[["Switching to DARK mode:"]]
        set-dark
    else
        say @blue[["Switching to LIGHT mode:"]]
        set-light
    fi
}

# Set icon theme
gsettings set org.gnome.desktop.interface icon-theme $ICON_THEME


# Toggle between Light & Dark
toggle-theme

# Kill plank
pkill plank

# Change windows tiltebar button placement
gsettings set org.gnome.desktop.wm.preferences button-layout ':minimize,maximize,close'

# Swap caps and escape
gsettings set org.gnome.desktop.input-sources xkb-options []

# Disable gnome-extensions
gnome-extensions disable InternetSpeedMonitor@Rishu;
gnome-extensions disable activate_gnome@isjerryxiao;
gnome-extensions disable dell-command-configure-menu@vsimkus.github.io;
gnome-extensions disable surf@diegonz.github.io;
gnome-extensions disable mousefollowsfocus@matthes.biz;
gnome-extensions enable workspace-switch-wraparound@theychx.org;
gnome-extensions enable workspaces-bar@fthx;
gnome-extensions disable ding@rastersoft.com;
gnome-extensions disable improved-workspace-indicator@michaelaquilina.github.io;
gnome-extensions disable inotch@alynx.one;
gnome-extensions disable gsconnect@andyholmes.github.io;
gnome-extensions disable impatience@gfxmonk.net;
gnome-extensions enable workspace_scroll@squgeim.com.np;
gnome-extensions disable soft-brightness@fifi.org;
gnome-extensions disable horizontal-workspaces@gnome-shell-extensions.gcampax.github.com;
gnome-extensions disable hibernate-status@dromi;
gnome-extensions disable user-theme@gnome-shell-extensions.gcampax.github.com;
gnome-extensions disable drive-menu@gnome-shell-extensions.gcampax.github.com;
gnome-extensions disable sound-output-device-chooser@kgshank.net;
gnome-extensions disable HijriCalendar@oxygenws.com;
gnome-extensions enable Vitals@CoreCoding.com;
gnome-extensions disable auto-move-windows@gnome-shell-extensions.gcampax.github.com;
gnome-extensions disable gnomebedtime@ionutbortis.gmail.com;
gnome-extensions disable toggle-night-light@cansozbir.github.io;
gnome-extensions enable wintile@nowsci.com;
gnome-extensions enable x11gestures@joseexposito.github.io;
gnome-extensions disable pop-shell@system76.com;
gnome-extensions enable desktop-icons@csoriano;
gnome-extensions enable ubuntu-appindicators@ubuntu.com;
gnome-extensions enable ubuntu-dock@ubuntu.com;

