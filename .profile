# Start sway if we're on tty1
if [[ "$(tty)" == "/dev/tty1" ]]; then
  export XDG_SESSION_TYPE=wayland
  export XDG_SESSION_DESKTOP=sway
  export XDG_CURRENT_DESKTOP=sway

  export VK_DRIVER_FILES=/usr/share/vulkan/icd.d/radeon_icd.x86_64.json

  # Wayland stuff
  export QT_QPA_PLATFORM=wayland
  export SDL_VIDEODRIVER=wayland
  export _JAVA_AWT_WM_NONREPARENTING=1

  exec dbus-launch sway --unsupported-gpu "$@"
fi
