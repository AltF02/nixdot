{
  inputs,
  pkgs,
  ...
} @ args: {
  programs.helix = {
    enable = true;
    package = inputs.helix.packages.${pkgs.system}.default;
    
    catppuccin.enable = true;
    
    settings = {
      editor = {
        line-number = "relative";
        auto-save = true;
        
        lsp = {
          display-messages = true;
        };
      
        cursor-shape = {
          insert = "bar";
          select = "underline";
        };
       
        file-picker = {
          hidden = true;
        };

        indent-guides = {
          render = true;
          character = "┊";
        };
      };
      
      keys.insert = {
        "A-x" = "normal_mode";
      };
    };
  };
}
