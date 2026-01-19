{ self, ... }:
{
  home.file."Pictures/wallpapers" = {
    source = "${self}/assets/wallpapers";
    recursive = true;
    target = "Pictures/wallpapers";
  };
}
