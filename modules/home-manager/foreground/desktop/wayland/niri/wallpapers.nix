{ self, ... }:
{
  home.file."Pictures/dark-wallpapers" = {
    source = "${self}/assets/dark-wallpapers";
    recursive = true;
  };

  home.file."Pictures/light-wallpapers" = {
    source = "${self}/assets/light-wallpapers";
    recursive = true;
  };
}
