{ ... }:
{
  imports = [
    ./networkmanager.nix
  ];
  services = {
    netbird = {
      enable = true;
      tunnels = {
        perso = {
          port = 51820;
          environment = {
            NB_ADMIN_URL = "https://netbird.bastincloud.com";
            NB_MANAGEMENT_URL = "https://netbird.bastincloud.com";
          };
        };
      };
    };
  };
}
