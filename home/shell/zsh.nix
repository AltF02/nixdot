{
  config,
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    zsh-powerlevel10k
    zsh-you-should-use
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    autocd = true;
    dotDir = ".config/zsh";
    history = {
      expireDuplicatesFirst = true;
      path = "${config.xdg.dataHome}/zsh_history";
    };

    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];
    oh-my-zsh = {
      enable = true;
      plugins= [ "git" "kubectl" "zsh-you-should-use" ];
      theme = "powerlevel10k/powerlevel10k";
    };

    shellAliases = {
      cat = "bat -pp";
      upd = "sudo nixos-rebuild switch --upgrade";
    };
    shellGlobalAliases = {exa = "exa --icons --git";};
  };
}
