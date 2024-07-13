{ inputs, pkgs,lib, config, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./packages.nix
    ./modules/bundle.nix
  ];

  disabledModules = [
    ./modules/xserver.nix
  ];

  networking.hostName = "pc-home"; # Define your hostname.
#  networking.nameservers = [ "8.8.8.8" ];
  #networking.resolvconf.enable = true;
  networking.nameservers = [ "1.1.1.1#one.one.one.one" "1.0.0.1#one.one.one.one" ];

services.resolved = {
  enable = true;
  dnssec = "true";
  domains = [ "~." ];
  fallbackDns = [ "1.1.1.1#one.one.one.one" "1.0.0.1#one.one.one.one" ];
  dnsovertls = "true";
};


  time.timeZone = "Europe/Moscow"; # Set your time zone.

  i18n.defaultLocale = "en_US.UTF-8"; # Select internationalisation properties.

   # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];
  #hardware.nvidia.powerManagement.finegrained = lib.mkForce false;
  hardware.nvidia = {

    # Modesetting is required.
    modesetting.enable = true;

    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    # Enable this if you have graphical corruption issues or application crashes after waking
    # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead
    # of just the bare essentials.
    powerManagement.enable = true;

    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
    powerManagement.finegrained = false;

    open = false;

    nvidiaSettings = true;

    package = config.boot.kernelPackages.nvidiaPackages.production;

  };

  # NixOS specialization named 'nvidia-sync'. Provides the ability
  # to switch the Nvidia Optimus Prime profile
  # to sync mode during the boot process, enhancing performance.
  # Enable OpenGL
  nix.settings.experimental-features = [ "nix-command" "flakes" ]; # Enabling flakes

            environment = {
                sessionVariables = {
                    NIXOS_OZONE_WL = "1"; # Hint electron apps to use wayland
                    WLR_NO_HARDWARE_CURSORS = "1"; # Fix cursor rendering issue on wlr nvidia.

                    XDG_CURRENT_DESKTOP = "Hyprland";
                    XDG_SESSION_TYPE = "wayland";
                    XDG_SESSION_DESKTOP = "Hyprland";

                    GBM_BACKEND = "nvidia-drm";
                    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
                    LIBVA_DRIVER_NAME = "nvidia";
                    __GL_GSYNC_ALLOWED = "1";
                    __GL_VRR_ALLOWED = "0"; 
                    WLR_DRM_NO_ATOMIC = "1";

                    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
                    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
                    QT_QPA_PLATFORM = "wayland";
                    QT_QPA_PLATFORMTHEME = "qt5ct";

                    GDK_SCALE = "2";

                    ELECTRON_OZONE_PLATFORM_HINT = "auto";

                    NVD_BACKEND = "direct";
                };

                systemPackages = with pkgs; [
                    pyprland
                ];
            };
  
  system.stateVersion = "24.05"; # Don't change it bro
}

