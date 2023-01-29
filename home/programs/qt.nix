{
  pkgs,
  config,
  ...
}: {
  qt = {
    platformTheme = "gnome";
    style.name = "adwaita-dark";
  };
}
