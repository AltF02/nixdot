{
  home = {
    username = "matt";
    homeDirectory = "/home/matt";
    stateVersion = "22.11";
    extraOutputsToInstall = ["doc" "devdoc"];
  };

  # let HM manage itself when in standalone mode
  programs.home-manager.enable = true;
}
