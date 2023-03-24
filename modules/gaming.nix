{
  pkgs,
  config,
  ...
}: {
  networking = {
    firewall = {
      # GTA
      allowedUDPPortRanges = [
        {
          from = 61455;
          to = 61458;
        }
      ];
      allowedUDPPorts = [6672];
    };
  };

  hardware.steam-hardware.enable = true;

  # programs.steam = {
  #   enable = true;
  #   remotePlay.openFirewall = true;
  # };
}
