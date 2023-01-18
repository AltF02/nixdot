{
  config,
  pkgs,
  inputs,
  ...
} @ args: {
  imports = [./hardware-configuration.nix];

  boot = {
    initrd = {
      systemd.enable = true;
      supportedFilesystems = ["btrfs"];
    };

    # load modules on boot
    kernelModules = ["kvm-amd"];

    # use latest kernel
    kernelPackages = pkgs.linuxPackages_xanmod_latest;

    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
      grub = {
        devices = [ "nodev" ];
        enable = true;
        efiSupport = true;
        version = 2;
        useOSProber = true;

        catppuccin = {
         enable = true;
         palette = "mocha";
        };
      };
    };
  };

  environment.systemPackages = [config.boot.kernelPackages.cpupower];

  hardware = {
    bluetooth = {
      enable = true;
    };

    cpu.amd.updateMicrocode = true;

    nvidia = {
      # use beta drivers
      package = config.boot.kernelPackages.nvidiaPackages.beta;
      # required for wayland
      modesetting.enable = true;
    };
  };

  networking = {
    hostName = "saturn";
  };

  programs = {
    xwayland.enable = true;
  };

  security.tpm2 = {
    enable = true;
    abrmd.enable = true;
  };

  services = {
    btrfs.autoScrub.enable = true;

    # for SSD/NVME
    fstrim.enable = true;

    # see https://github.com/fufexan/nix-gaming/#pipewire-low-latency
    pipewire.lowLatency.enable = true;

    printing.enable = true;

    xserver.videoDrivers = ["nvidia"];
  };
}
