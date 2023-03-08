{pkgs, config, lib, ...}:
{
  home.packages = with pkgs; [
    dlv
    gopls
    lldb-vscode
    nil
    rust-analyzer
    vls
  ]
}