{
  pkgs,
  config,
  ...
}: {
  home.packages = [pkgs.adwaita-qt];

  qt = {
    platformTheme = "gnome";
    style.name = "adwaita-dark";
  };
}
