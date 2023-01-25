{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    # office
    libreoffice

    # let discord open links
    xdg-utils

    # torrents
    qbittorrent

    # misc
    vim

    # audio
    easyeffects

    # programming
    jetbrains.clion
    jetbrains.rider
    jetbrains.webstorm

    # compilers
    rustup
    clang

    # productivity
    obsidian

    # mail
    hydroxide
    thunderbird
  ];
}
