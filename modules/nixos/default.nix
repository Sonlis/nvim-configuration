{ ... }:
{
  imports = [
    ./environment
    ./gui
    ./network
    ./system
  ];

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };
  environment.localBinInPath = true;
  programs.nix-ld.enable = true;

  # Fix uv python ssl.SSLCertVerificationError
  # Source: https://discourse.nixos.org/t/fix-ssl-sslcertverificationerror-with-uvs-standalone-python/71138
  environment.etc.certfile = {
    source = "/etc/ssl/certs/ca-bundle.crt";
    target = "ssl/cert.pem";
  };
}
