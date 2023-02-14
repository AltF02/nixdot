{
  programs.gnome-terminal = {
    enable = true;

    profile."acd6d090-49c7-4709-be81-8cedb4207b07" = {
      cursorShape = "ibeam";
      customCommand = "zsh";
      default = true;
      font = "FiraCode Nerd Font Mono 11";
      loginShell = true;
      visibleName = "p10k";
    };
  };
}
