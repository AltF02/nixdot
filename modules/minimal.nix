{
  pkgs,
  config,
  lib,
  inputs,
  ...
}:
# configuration shared by all hosts
{
  # enable zsh autocompletion for system packages (systemd, etc)
  environment.pathsToLink = ["/share/zsh"];

  i18n = {
    defaultLocale = "en_US.UTF-8";
    # saves space
    supportedLocales = ["en_US.UTF-8/UTF-8"];
  };

  # graphics drivers / HW accel
  hardware.opengl.enable = true;

  networking = {
    # required to connect to Tailscale exit nodes
    firewall.checkReversePath = "loose";

    networkmanager = {
      enable = true;
      dns = "systemd-resolved";
    };
  };

  # pickup pkgs from flake export
  nixpkgs.pkgs = inputs.self.legacyPackages.${config.nixpkgs.system};

  # enable programs
  programs = {
    less.enable = true;

    zsh = {
      enable = true;
      autosuggestions.enable = true;
      syntaxHighlighting = {
        enable = true;
        patterns = {"rm -rf *" = "fg=white,bg=red";};
        styles = {"alias" = "fg=magenta";};
        highlighters = ["main" "brackets" "pattern"];
      };
    };
  };

  # don't ask for password for wheel group
  security.sudo.wheelNeedsPassword = false;

  services = {
    openssh = {
      enable = true;
      useDns = true;
    };

    # DNS resolver
    resolved.enable = true;

    # inter-machine VPN
    tailscale.enable = true;
  };

  # don't touch this
  system.stateVersion = lib.mkDefault "22.11";

  time.timeZone = lib.mkDefault "Europe/Amsterdam";

  users.users.matt = {
    isNormalUser = true;
    #shell = pkgs.zsh;
    extraGroups = ["adbusers" "input" "libvirtd" "networkmanager" "plugdev" "transmission" "video" "wheel"];
  };

  # compresses half the ram for use as swap
  zramSwap.enable = true;
}
