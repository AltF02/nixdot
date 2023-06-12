{...}: {
  programs.librewolf = {
    enable = true;
    settings = {
      "browser.search.suggest.enabled" = true;
      "browser.urlbar.suggest.searches" = true;
      "browser.toolbars.bookmarks.visibility" = "always";
      "identity.fxaccounts.enabled" = true;
      "privacy.clearOnShutdown.cookies" = false;
      "privacy.clearOnShutdown.cache" = false;
      "privacy.clearOnShutdown.offlineApps" = false;
    };
  };
}
