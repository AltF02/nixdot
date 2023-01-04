{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    # archives
    zip
    unzip
    unrar

    # office
    libreoffice

    # let discord open links
    xdg-utils

    # torrents
    qbittorrent

    # misc
    libnotify

    # audio
    easyeffects

    # programming
    jetbrains.clion
    jetbrains.rider
    jetbrains.webstorm

    # productivity
    obsidian
  ];
}
