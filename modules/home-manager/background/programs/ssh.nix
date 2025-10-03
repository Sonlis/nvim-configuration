{ config, lib, ... }:
{
  options.ssh.matchBlocks = lib.mkOption {
    type = lib.types.attrs;
    default = {
      all = {
        addKeysToAgent = "yes";
      };
    };
  };

  config = {
    programs.ssh = {
      enable = true;
      enableDefaultConfig = false;
      matchBlocks = config.ssh.matchBlocks;
    };
  };
}
