{ self, ... }:
{
  xdg.configFile."personal-public-cloud" = {
    enable = true;
    target = "public-cloud-auth/perso.sh";
    text = builtins.readFile "${self}/assets/development/PCP-T6HHNXJ-openrc.sh";
  };
  #age.secrets.secret1.file = "${self}/secret1.age";
}
