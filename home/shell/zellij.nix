{pkgs, ...}: {
  home.packages = with pkgs; [wl-clipboard];

  programs.zellij = {
    enable = true;
    settings = {
      simplified_ui = true;
      pane_frames = false;
      copy_command = "wl-copy";
      scroll_buffer_size = 50000;
    };
  };
}
