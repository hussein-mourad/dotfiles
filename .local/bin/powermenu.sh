#!/bin/bash

# Display icon
echo "⏻"

# Click actions
case "$BLOCK_BUTTON" in
1) # left click
  option=$(echo -e "Shutdown\nReboot\nSuspend\nLogout" | rofi -dmenu -i -p "Power")
  case $option in
  Shutdown) systemctl poweroff ;;
  Reboot) systemctl reboot ;;
  Suspend) systemctl suspend ;;
  Logout) i3-msg exit ;;
  esac
  ;;
esac
