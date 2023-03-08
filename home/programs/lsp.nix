{
  pkgs,
  config,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    delve
    gopls
    lldb
    nil
    rust-analyzer
    nodePackages_latest.vls
  ];
}
