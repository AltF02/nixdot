{
  inputs,
  self,
  withSystem,
  module_args,
  ...
}: let
  sharedModules = [
    ../.
    ../shell
    module_args
  ];

  desktopModules = with inputs; [
    catppuccin.desktopModules.default
  ];

  homeImports = {
    "matt@saturn" =
      sharedModules
      ++ desktopModules
      ++ [./saturn];
  };

  inherit (inputs.hm.lib) homeManagerConfiguration;
in {
  imports = [
    {_module.args = {inherit homeImports;};}
  ];

  flake = {
    homeConfigurations = withSystem "x86_64-linux" ({pkgs, ...}: {
      "matt@saturn" = homeManagerConfiguration {
        modules = homeImports."matt@saturn" ++ module_args;
        inherit pkgs;
      };
    });
  };
}
