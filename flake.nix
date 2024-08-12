{
  description = "My system configuration";

  inputs = {
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        nur.url = "github:nix-community/NUR";
        neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
        nix-gaming.url = "github:fufexan/nix-gaming";
        #spicetify-nix.url = "github:the-argus/spicetify-nix";

        hyprland = {
          url = "github:hyprwm/Hyprland/v0.39.1";
          inputs.nixpkgs.follows = "nixpkgs";
        };

        hyprlock = {
          url = "github:hyprwm/hyprlock";
          inputs.hyprlang.follows = "hyprland/hyprlang";
          inputs.nixpkgs.follows = "hyprland/nixpkgs";
          inputs.systems.follows = "hyprland/systems";
        };

        hypridle = {
          url = "github:hyprwm/hypridle";
          inputs.hyprlang.follows = "hyprland/hyprlang";
          inputs.nixpkgs.follows = "hyprland/nixpkgs";
          inputs.systems.follows = "hyprland/systems";
        };

        xdghypr = {
          url = "github:hyprwm/xdg-desktop-portal-hyprland";
          inputs.nixpkgs.follows = "nixpkgs";
        };

        flake-parts = {
          url = "github:hercules-ci/flake-parts";
          inputs.nixpkgs-lib.follows = "nixpkgs";
        };

        spicetify-nix = {
            url = "github:the-argus/spicetify-nix";
            inputs.nixpkgs-lib.follows = "nixpkgs";
        };

        home-manager = {
          url = "github:nix-community/home-manager";
          inputs.nixpkgs.follows = "nixpkgs";
        };

        disko = {
          url = "github:nix-community/disko";
          inputs.nixpkgs.follows = "nixpkgs";
        };

        sops-nix = {
          url = "github:Mic92/sops-nix";
          inputs.nixpkgs.follows = "nixpkgs";
        };

        firefox-addons = {
          url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
          inputs.nixpkgs.follows = "nixpkgs";
        };

    #polymc.url = "github:PolyMC/PolyMC";
  };

  outputs = { self, nixpkgs, nixpkgs-stable, home-manager, ... }@inputs:

    let
      system = "x86_64-linux";
    in {

    # nixos - system hostname
    nixosConfigurations.pc-home = nixpkgs.lib.nixosSystem {
      specialArgs = {
        pkgs-stable = import nixpkgs-stable {
          inherit system;
          config.allowUnfree = true;
        };
        inherit inputs system;
      };
      modules = [
        ./nixos/pc-home/configuration.nix
        inputs.nixvim.nixosModules.nixvim
      ];
    };

    homeConfigurations.ilya = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system};
      modules = [ ./nixos/pc-home/home-manager/default.nix ];
    };
  };
}
