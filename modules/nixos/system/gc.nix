{
  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    optmisise = {
      automatic = true;
      dates = [ "14:00" ];
    };
  };
}
