{
  ...
}:
let
  files = map (file: ./. + builtins.unsafeDiscardStringContext "/${file}") (
    builtins.filter (f: f != "default.nix") (builtins.attrNames (builtins.readDir ./.))
  );
in
{
  imports = [
  ]
  ++ files;
}
