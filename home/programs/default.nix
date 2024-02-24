{config, ...}: {
  imports = [
    ../shell/nix.nix
    ./files
    ./git.nix
    ./gtk.nix
    ./firefox.nix
    ./flatpak.nix
    ./librewolf.nix
    ./lsp.nix
    ./packages.nix
    ./qt.nix
    ./xdg.nix
    ./yubikey.nix
  ];

  programs = {
    gpg = {
      enable = true;
      homedir = "${config.xdg.dataHome}/gnupg";
    };

    direnv.enable = true;
  };

  services = {
    gpg-agent = {
      enable = true;
      enableSshSupport = true;
      enableExtraSocket = true;

      defaultCacheTtl = 60;
      maxCacheTtl = 120;

      defaultCacheTtlSsh = 60;
      maxCacheTtlSsh = 120;

      pinentryFlavor = "gnome3";
    };
  };
}
