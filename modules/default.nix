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
          ./minimal.nix
          module_args
          ./nix.nix
          ./security.nix
        ];

        desktopModules = with inputs; [
          nix-gaming.nixosModules.default
          catppuccin.nixosModules.default
        ];
      };
    }
  ];
}
