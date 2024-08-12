{
  pkgs,
  root,
  ...
}: let
  Vesktop = pkgs.callPackage "/home/ilya/flake/nixos/pc-home/home-manager/overlays/vesktop.nix" {};
#  Vesktop = pkgs.callPackage "../../overlays/vesktop.nix" {};
in {
  imports = [(import ./theme.nix)];
  home.packages = with pkgs; [Vesktop];
}
