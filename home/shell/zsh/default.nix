{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    autocd = true;
    dotDir = ".config/zsh";
    history = {
      expireDuplicatesFirst = true;
      path = "${config.home.homeDirectory}/.config/zsh/.zsh_history";
    };

    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "you-should-use";
        src = pkgs.zsh-you-should-use;
        file = "share/zsh/plugins/you-should-use/you-should-use.plugin.zsh";
      }
    ];
    oh-my-zsh = {
      enable = true;
      plugins = ["git" "kubectl"];
    };

    initExtra = ''
      # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
      # Initialization code that may require console input (password prompts, [y/n]
      # confirmations, etc.) must go above this block; everything else may go below.
      if [[ -r "${config.xdg.cacheHome}/p10k-instant-prompt-$\{(%):-%n}.zsh" ]]; then
        source "${config.xdg.cacheHome}/p10k-instant-prompt-$\{(%):-%n}.zsh"
      fi

      # To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
      [[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
    '';

    shellAliases = {
      cat = "bat -pp";
      upd = "doas nixos-rebuild switch --upgrade";
    };
    shellGlobalAliases = {exa = "exa --icons --git";};
  };

  home.file.".config/zsh/.p10k.zsh".text = builtins.readFile ./p10k.zsh;
}
