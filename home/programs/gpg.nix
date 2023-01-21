{
  pkgs,
  config,
  ...
}: {
  programs.gpg = {
    enable = true;
    homedir = "${config.xdg.dataHome}/gnupg";
  };

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    enableExtraSocket = true;

    defaultCacheTtl = 60;
    maxCacheTtl = 120;

    defaultCacheTtlSsh = 60;
    maxCacheTtlSsh = 120;

    pinentryFlavor = "gnome3";
  };
}
