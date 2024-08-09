if test (tty) = "/dev/tty1"
  set -x XDG_SESSION_TYPE wayland
  set -x XDG_SESSION_DESKTOP sway
  set -x XDG_CURRENT_DESKTOP sway

  set -x VK_DRIVER_FILES /usr/share/vulkan/icd.d/radeon_icd.x86_64.json

  # Wayland stuff
  set -x QT_QPA_PLATFORM wayland
  set -x SDL_VIDEODRIVER wayland
  set -x _JAVA_AWT_WM_NONREPARENTING 1

  exec dbus-launch sway --unsupported-gpu $argv
end
