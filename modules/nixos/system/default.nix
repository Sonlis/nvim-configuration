{ ... }:
{
  imports = [
    ./battery.nix
    ./bluetooth.nix
    ./boot.nix
    ./gpg.nix
    ./packages.nix
    ./printing.nix
    ./shell.nix
    ./sound.nix
    ./timezone.nix
    ./users.nix
  ];

  i18n.defaultLocale = "en_US.UTF-8";
}
