{

  imports = [
    ./zsh.nix
    ./modules/bundle.nix
  ];

  home = {
    username = "ilya";
    homeDirectory = "/home/ilya";
    stateVersion = "24.05";
  };
}
