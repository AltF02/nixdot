{
  pkgs,
  lib,
  config,
  default,
  ...
}:
# Wayland nvidia config
{
  # make stuff work on wayland
  home.sessionVariables = {
    EGL_PLATFORM = "wayland";
    MOZ_DISABLE_RDD_SANDBOX = "1";
  };
}
