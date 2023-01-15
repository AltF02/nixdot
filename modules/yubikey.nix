{
  pkgs,
  config,
  lib,
  inputs,
  ...
}: {
  services = {
    udev.packages = with pkgs; [yubikey-personalization];
    pcscd.enable = true;
  };
}
