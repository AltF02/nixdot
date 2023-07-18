{pkgs, ...}: {
  home.packages = with pkgs; [
    # office
    # libreoffice

    # let discord open links
    xdg-utils

    # torrents
    qbittorrent

    # networking
    protonvpn-gui
    pritunl-client
    mullvad-vpn

    # misc
    vim
    pinentry

    # gaming
    prismlauncher

    # audio
    easyeffects

    # compilers/interpreters
    rustup
    clang
    nodejs
    deno
    gnumake
    gcc

    # mail
    thunderbird
  ];
}
