{...}: {
  programs.firefox = {
    enable = true;
    profiles.matt = {
      settings = {
        "browser.toolbars.bookmarks.visibility" = "always";
        "dom.security.https_only_mode" = true;
      };
    };
  };
}
