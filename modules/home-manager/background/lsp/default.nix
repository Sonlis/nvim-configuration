{
  config,
  pkgs,
  lib,
  ...
}:
{
  options.ide = lib.mkOption {
    type = lib.types.str;
    default = "nvim";
    description = "Choose which IDE should be installed";
  };

  config = {
    home.packages = [

    ]
    ++ (
      if config.ide == "nvim" then
        with pkgs; [
          neovim
          shellcheck
          bash-language-server
          gopls
          lua-language-server
          nil
          nixfmt-rfc-style
        ]
      else
        [ ]
    );
  };
}
