{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    file
    foot
    git
    lsof
    dnsutils
    netbird
    uwsm
    vim
    wget
    wireguard-tools
  ];
  services = {
    udev.packages = [ pkgs.yubikey-personalization ];
  };
}
