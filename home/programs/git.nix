{pkgs, ...}: {
  home.packages = [pkgs.gh];

  programs.git = {
    enable = true;

    ignores = ["*~" "*.swp" "*result*" ".direnv" "node_modules"];

    signing = {
      key = "0x235DC1577188A5E4";
      signByDefault = true;
    };

    userEmail = "contact@altf2.dev";
    userName = "AltF2";
  };
}
