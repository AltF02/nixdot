{
  pkgs,
  config,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    delve
    gopls
    lldb-vscode
    nil
    rust-analyzer
    vls
  ];
}
