{
  lib,
  config,
  ...
}:
let
  terminals = [
    "foot"
  ];
in
{
  imports = [
    ./foot.nix
  ];

  options.terminal = {
    enable = lib.mkEnableOption "Enable configured terminals";
    main = lib.mkOption {
      type = lib.types.str;
      default = "foot";
      example = "foot";
      description = ''
        Main terminal to be used, for example in shortcuts.
        This one will be always enabled!
      '';
    };
  };

  config = lib.mkIf config.terminal.enable {
    programs =
      (lib.genAttrs terminals (
        # loops over all terminal attributes defined above
        term:
        lib.genAttrs [ "enable" ] (
          # for the enable attribute
          val: lib.mkDefault (if config.terminal.main == term then true else false)
        )
      ))
      // {
        # # here you can force a terminal to be enabled!
        # alacritty.enable = lib.mkForce true;
        # warp.enable = true;
      };
  };
}
