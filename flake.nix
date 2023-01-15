{
  description = "AltF02's NixOS and Home-Manager flake";

  outputs = {nixpkgs, ...} @ inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux"];

      imports = [
        ./home/profiles
        ./hosts
        ./modules
        ./pkgs
        ./lib
        {config._module.args._inputs = inputs // {inherit (inputs) self;};}
      ];

      perSystem = {
        config,
        self',
        inputs',
        pkgs,
        system,
        ...
      }: {
        imports = [
          {
            _module.args.pkgs = inputs.self.legacyPackages.${system};
          }
        ];

        devShells.default = inputs'.devshell.legacyPackages.mkShell {
          packages = [
            pkgs.alejandra
            pkgs.git
          ];
          name = "dots";
        };

        formatter = pkgs.alejandra;
      };
    };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";

    devshell.url = "github:numtide/devshell";

    fu.url = "github:numtide/flake-utils";

    helix.url = "github:SoraTenshi/helix/experimental-22.12";

    hm = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";

    nix-gaming.url = "github:fufexan/nix-gaming";

    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "fu";
    };
  };
}
