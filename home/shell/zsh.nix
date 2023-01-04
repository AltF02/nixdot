{
  config,
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    zsh-autosuggestions
    zsh-you-should-use
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    autocd = true;
    dotDir = ".config/zsh";

    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];
    oh-my-zsh = {
      enable = true;
      plugins= [ git kubectl zsh-autosuggestions zsh-you-should-use ];
      theme = "powerlevel10k/powerlevel10k";
    };

    shellAliases = {
      cat = "bat -pp";
    };
    shellGlobalAliases = {exa = "exa --icons --git";};
  };
}
