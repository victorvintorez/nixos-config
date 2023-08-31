{ options, pkgs, ... }: {
  programs.rbw = {
    enable = true;
    settings = {
      base_url = "https://vaultwarden.murein.cymru";
      email = "victorvintorez+vaultwarden@proton.me";
    };
  };
}
