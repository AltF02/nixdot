{
  lib,
  pkgs,
  ...
}:
# GNOME 43 config
{
  environment.systemPackages = with pkgs; [
    gnome.gnome-tweaks
  ];

  # we're using pipewire instead
  hardware.pulseaudio.enable = lib.mkForce false;

  services.power-profiles-daemon.enable = lib.mkForce false;
  services.xserver = {
    desktopManager.gnome = {
      enable = true;
    };
  };
}
