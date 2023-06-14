{pkgs, ...}: {
  home.packages = with pkgs; [
    # archives
    zip
    unzip
    unrar

    # utils
    file
    du-dust
    duf
    fd
    ripgrep
    nvtop

    # kubernetes
    helm
    kubectl
    k9s

    # file managers
    joshuto
    ranger
  ];

  programs = {
    bat.enable = true;
    btop.enable = true;
    exa.enable = true;
    ssh.enable = true;
  };
}
