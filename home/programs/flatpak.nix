{
  config,
  pkgs,
  ...
}: {
  home.packages = [pkgs.flatpak];

  home.file.".icons/Adwaita".source = config.lib.file.mkOutOfStoreSymlink "/run/current-system/sw/share/icons/Adwaita";
  home.file.".local/share/flatpak/overrides/global".text = ''
    [Context]
    filesystems=/run/current-system/sw/share/X11/fonts:ro;~/.local/share/color-schemes:ro;xdg-config/gtk-3.0:ro;/nix/store:ro;~/.icons:ro
  '';
}
