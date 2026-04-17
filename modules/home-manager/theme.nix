{ lib, ... }:
{
  options = {
    theme = lib.mkOption {
      description = "Theme to apply to various softs";
      type = lib.types.str;
    };
  };
}
