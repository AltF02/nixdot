{
  _inputs,
  inputs,
  self,
  default,
  ...
}: let
  module_args = {
    _module.args = {
      inputs = _inputs;
      inherit default;
    };
  };
in {
  imports = [
    {
      _module.args = {
        inherit module_args;

        sharedModules = [
          {home-manager.useGlobalPkgs = true;}
          inputs.hm.nixosModule
          ./dnsproxy.nix
          ./minimal.nix
          module_args
          ./nix.nix
          ./security.nix
        ];

        desktopModules = with inputs; [
          hyprland.nixosModules.default
          nix-gaming.nixosModules.default
          catppuccin.nixosModules.default
        ];
      };
    }
  ];
}
