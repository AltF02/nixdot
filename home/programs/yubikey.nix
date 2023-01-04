{pkgs, ...}: {
  services = {
    pcscd.enable = true;
    udev.packages = [pkgs.yubikey-personalization];
  };

  home.packages = with pkgs; [
    pcsctools

    yubikey-manager
    yubikey-manager-qt
    yubikey-personalization
    yubikey-personalization-gui
    yubico-piv-tool
    yubioath-desktop
  ];
}
