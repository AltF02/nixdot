{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    # office
    # libreoffice

    # let discord open links
    xdg-utils

    # torrents
    qbittorrent

    # misc
    vim

    # gaming
    prismlauncher

    # audio
    easyeffects

    # compilers
    rustup
    clang

    # mail
    hydroxide
    thunderbird
  ];
}
