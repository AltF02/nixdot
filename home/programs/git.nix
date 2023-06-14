{pkgs, ...}: {
  home.packages = with pkgs; [gh glab git-lfs];

  programs.git = {
    enable = true;

    ignores = ["*~" "*.swp" "*result*" ".direnv" "node_modules"];

    signing = {
      key = "0x235DC1577188A5E4";
      signByDefault = true;
    };

    userEmail = "contact@altf2.dev";
    userName = "AltF2";

    extraConfig = {
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
    }; 
  };
}
