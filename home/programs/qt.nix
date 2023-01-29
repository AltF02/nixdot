{
  pkgs,
  config,
  ...
}: {
  home.packages = [pkgs.adwaita-qt];

  qt = {
    style.name = "adwaita-dark";
  };
}
