{
  config,
  pkgs,
  inputs,
  ...
}: {
  fonts = {
    packages = with pkgs; [meslo-lgs-nf nerdfonts];
    fontDir.enable = true;
  };

  # use Wayland where possible (electron)
  environment.variables.NIXOS_OZONE_WL = "1";

  # enable location service
  location.provider = "geoclue2";

  nix.settings = {
    substituters = [
      "https://nix-gaming.cachix.org"
    ];
    trusted-public-keys = [
      "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
    ];
  };

  # make HM-managed GTK stuff work
  programs.dconf.enable = true;

  services = {
    # provide location
    geoclue2 = {
      enable = true;
      appConfig.gammastep = {
        isAllowed = true;
        isSystem = false;
      };
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      jack.enable = true;
      pulse.enable = true;
    };

    # battery info & stuff
    upower.enable = true;

    # needed for GNOME services outside of GNOME Desktop
    dbus.packages = [pkgs.gcr];
    udev.packages = with pkgs; [gnome.gnome-settings-daemon];

    flatpak.enable = true;
  };

  security = {
    # userland niceness
    rtkit.enable = true;
  };

  xdg.portal.enable = true;
}
