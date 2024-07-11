{ inputs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./packages.nix
    ./modules/bundle.nix
  ];

  disabledModules = [
    ./modules/xserver.nix
  ];

  nixpkgs.overlays = [
#      (_: prev: {
#          python312 = prev.python312.override { packageOverrides = _: pysuper: { nose = pysuper.pynose; }; };
#      })
      inputs.polymc.overlay
  ];

  networking.hostName = "pc-home"; # Define your hostname.

  time.timeZone = "Europe/Moscow"; # Set your time zone.

  i18n.defaultLocale = "en_US.UTF-8"; # Select internationalisation properties.

  nix.settings.experimental-features = [ "nix-command" "flakes" ]; # Enabling flakes

  system.stateVersion = "24.05"; # Don't change it bro
}
