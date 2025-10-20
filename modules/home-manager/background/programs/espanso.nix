{ config, lib, ... }:
let
  cfg = config.espanso;
in
{
  options = {
    espanso.matches = lib.mkOption {
      default = { };
      description = "List of espanso matches";
      type = lib.types.attrs;
    };
  };
  config = lib.mkIf (cfg.matches != { }) {
    services.espanso = {
      enable = true;
      configs = {
        default = {
          keyboard_layout = {
            layout = "us";
          };
        };
      };
      matches = cfg.matches;
    };
  };
}
