{
  pkgs,
  config,
  inputs,
  ...
}: {
  imports = [
    ../shell/nix.nix
    ./files
    ./git.nix
    ./flatpak.nix
    ./packages.nix
    ./xdg.nix
  ];

  programs = {
    firefox = {
      enable = true;
      profiles.matt = {};
    };

    gpg = {
      enable = true;
      homedir = "${config.xdg.dataHome}/gnupg";
    };
  };

  services = {
    gpg-agent = {
      enable = true;
      enableSshSupport = true;
    };
  };
}
