{
  config,
  pkgs,
  ...
}: let
  defaults = {
    browser = ["librewolf.desktop"];
    videoPlayer = ["org.gnome.Totem.desktop"];
    imageViewer = ["org.gnome.eog.desktop"];
    textEditor = ["org.gnome.TextEditor.desktop"];
  };
  
  # XDG MIME types
  associations = {
    "application/json" = defaults.textEditor;
    "application/pdf" = defaults.browser;
    "application/x-extension-htm" = defaults.browser;
    "application/x-extension-html" = defaults.browser;
    "application/x-extension-shtml" = defaults.browser;
    "application/x-extension-xht" = defaults.browser;
    "application/x-extension-xhtml" = defaults.browser;
    "application/xhtml+xml" = defaults.browser;
    "application/zip" = "org.gnome.FileRoller.desktop";
    "image/gif" = defaults.imageViewer;
    "image/jpeg" = defaults.imageViewer;
    "image/png" = defaults.imageViewer;
    "image/svg" = defaults.imageViewer;
    "text/html" = defaults.browser;
    "text/plain" = defaults.textEditor;
    "video/mp4" = defaults.videoPlayer;
    "video/quicktime" = defaults.videoPlayer;
    "x-scheme-handler/about" = defaults.browser;
    "x-scheme-handler/ftp" = defaults.browser;
    "x-scheme-handler/http" = defaults.browser;
    "x-scheme-handler/https" = defaults.browser;
    "x-scheme-handler/unknown" = defaults.browser;
  };
in {
  home.packages = [pkgs.xdg-desktop-portal-gtk];

  xdg = {
    enable = true;
    cacheHome = config.home.homeDirectory + "/.local/cache";

    mimeApps = {
      enable = true;
      defaultApplications = associations;
    };

    userDirs = {
      enable = true;
      createDirectories = true;
      extraConfig = {
        XDG_SCREENSHOTS_DIR = "${config.xdg.userDirs.pictures}/Screenshots";
      };
    };
  };
}
