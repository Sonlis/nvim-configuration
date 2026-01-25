{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    acl
    file
    foot
    git
    lazygit
    lsof
    dnsutils
    netbird
    uwsm
    vim
    wget
    wireguard-tools
  ];
  services = {
    udev = {
      packages = with pkgs; [
        yubikey-personalization
      ];
    };
  };
}
