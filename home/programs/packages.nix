{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    # RIIR
    (pkgs.uutils-coreutils.override { prefix = ""; })

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

    # productivity
    obsidian
  ];
}
