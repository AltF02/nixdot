{
  inputs,
  pkgs,
  ...
} @ args: {
  programs.helix = {
    enable = true;
    package = inputs.helix.packages.${pkgs.system}.default;
    catppuccin.enable = true;
  };
}
