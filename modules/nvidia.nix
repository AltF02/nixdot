{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = [pkgs.cudatoolkit];

  hardware.nvidia = {
    # use beta drivers
    package = config.boot.kernelPackages.nvidiaPackages.beta;
    # required for wayland
    modesetting.enable = true;
  };

  systemd.services.nvidia-control-devices = {
    wantedBy = ["multi-user.target"];
    serviceConfig.ExecStart = "${pkgs.linuxPackages.nvidia_x11.bin}/bin/nvidia-smi";
  };

  services.xserver.videoDrivers = ["nvidia"];
}
