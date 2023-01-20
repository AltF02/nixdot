{
  pkgs,
  config,
  lib,
  inputs,
  ...
}:
# configuration shared by all hosts
{
  environment.systemPackages = [pkgs.busybox];

  # enable zsh autocompletion for system packages (systemd, etc)
  environment.pathsToLink = ["/share/zsh"];

  i18n = {
    defaultLocale = "en_US.UTF-8";
    # saves space
    supportedLocales = ["en_US.UTF-8/UTF-8"];
  };

  # graphics drivers / HW accel
  hardware.opengl.enable = true;

  networking.networkmanager = {
    enable = true;
    dns = "resolved";
    dhcp = "dhcpcd";

    ethernet.macAddress = "random";
    wifi.macAddress = "random";
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

  services = {
    openssh = {
      enable = true;
      settings.UseDns = true;
    };

    # DNS resolver
    resolved.enable = true;
  };

  # don't touch this
  system.stateVersion = lib.mkDefault "22.11";

  # Don't wait for network startup
  # https://old.reddit.com/r/NixOS/comments/vdz86j/how_to_remove_boot_dependency_on_network_for_a
  systemd = {
    targets.network-online.wantedBy = pkgs.lib.mkForce []; # Normally ["multi-user.target"]
    services.NetworkManager-wait-online.wantedBy = pkgs.lib.mkForce []; # Normally ["network-online.target"]
  };

  time.timeZone = lib.mkDefault "Europe/Amsterdam";

  users.users.matt = {
    isNormalUser = true;
    description = "Matt";
    shell = pkgs.zsh;
    extraGroups = ["adbusers" "input" "libvirtd" "networkmanager" "plugdev" "video" "wheel"];
  };

  # compresses half the ram for use as swap
  zramSwap.enable = true;
}
