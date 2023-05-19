{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    delve
    gopls
    lldb
    nil
    # rust-analyzer
    nodePackages_latest.vls
  ];
}
