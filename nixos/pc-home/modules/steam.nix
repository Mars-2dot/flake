{ inputs, pkgs,lib, config, ...}: {
programs.steam = {
  enable = true;
  remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
  dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
};
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "steam"
    "steam-original"
    "steam-run"
  ];
#  programs.steam = {
#    enable = true;
#    gamescopeSession.enable = true;
#    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
#    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
#    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
#    package = with pkgs; steam.override { extraPkgs = pkgs: [
#      attr
#      bumblebee
#      glxinfo
#    ]; };
#  };
#
#    nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
#      "steam"
#      "steam-original"
#      "steam-run"
#    ];
}