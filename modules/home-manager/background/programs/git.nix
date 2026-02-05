{ lib, config, ... }:
{

  options.git = {
    userName = lib.mkOption {
      type = lib.types.str;
      default = "Sonlis";
    };
    email = lib.mkOption {
      type = lib.types.str;
      default = "bastien.jeannelle@gmail.com";
    };
    signingKey = lib.mkOption {
      type = lib.types.str;
      default = "";
    };
  };

  config = {
    programs.git = {
      settings = {
        user = {
          name = "${config.git.userName}";
          email = "${config.git.email}";
          safe.directory = [ "/etc/nixos" ];
          pull.rebase = true;
          gpg = {
            format = "ssh";
          };
        };
        enable = true;
        signing = {
          key = config.git.signingKey;
          signByDefault = true;
        };
      };
    };
  };
}
