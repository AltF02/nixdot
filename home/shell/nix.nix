{
  pkgs,
  inputs,
  ...
}:
# nix tooling
{
  home.packages = with pkgs; [
    alejandra
    deadnix
    nix-index
    statix
  ];
}
