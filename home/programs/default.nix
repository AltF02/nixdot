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
    ./gtk.nix
    ./flatpak.nix
    ./packages.nix
    ./xdg.nix
    ./yubikey.nix
  ];

  programs = {
    firefox = {
      enable = true;
      profiles.matt = {
        settings = {
          "browser.toolbars.bookmarks.visibility" = "always";
          "dom.security.https_only_mode" = true;
        };
      };
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
      enableExtraSocket = true;

      defaultCacheTtl = 60;
      maxCacheTtl = 120;
      
      defaultCacheTtlSsh = 60;
      maxCacheTtlSsh = 120;
      

      pinentryFlavor = "gnome3";
    };
  };
}
