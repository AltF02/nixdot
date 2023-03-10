{
  inputs,
  self,
  withSystem,
  sharedModules,
  desktopModules,
  homeImports,
  ...
}: {
  flake.nixosConfigurations = withSystem "x86_64-linux" ({system, ...}: {
    saturn = inputs.nixpkgs.lib.nixosSystem {
      inherit system;

      modules =
        [
          ./saturn
          ../modules/doas.nix
          ../modules/gaming.nix
          ../modules/gnome.nix
          ../modules/desktop.nix
          ../modules/nvidia.nix
          ../modules/xserver.nix
          ../modules/yubikey.nix
          {home-manager.users.matt.imports = homeImports."matt@saturn";}
        ]
        ++ sharedModules
        ++ desktopModules;
    };
  });
}
