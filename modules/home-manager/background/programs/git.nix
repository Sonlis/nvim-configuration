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
      enable = true;
      userName = "${config.git.userName}";
      userEmail = "${config.git.email}";
      signing = {
        key = config.git.signingKey;
        signByDefault = true;
      };
      extraConfig = {
        safe.directory = [ "/etc/nixos" ];
        pull.rebase = true;
        gpg = {
          format = "ssh";
        };
      };
    };
  };
}
