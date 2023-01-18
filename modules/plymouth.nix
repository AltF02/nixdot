{
  inputs,
  pkgs,
  ...
} @ args: {
  boot.plymouth = {
    enable = true;
    catppuccin= {
      enable = true;
      palette = "mocha";
    };
  };
}
