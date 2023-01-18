{
  inputs,
  pkgs,
  ...
} @ args: {
  boot.plymouth = {
    enable = true;
    themePackages = [ inputs.catppuccin.packages.${pkgs.system}.catppuccin-plymouth ];
    theme = "catppuccin-mocha";
  };
}
