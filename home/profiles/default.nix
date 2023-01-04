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

  homeImports = {
    "matt@saturn" =
      [
        ./saturn
      ]
      ++ sharedModules;
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
