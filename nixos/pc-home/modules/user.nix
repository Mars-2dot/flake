{ pkgs, ... }: {
  programs.zsh.enable = true;

  users = {
    defaultUserShell = pkgs.zsh;

    users.ilya = {
      isNormalUser = true;
      description = "ilya";
      extraGroups = [ "networkmanager" "wheel" "input" "libvirtd" "docker" "dialout" "vboxusers" ];
      packages = with pkgs; [];
    };
  };

  users.extraGroups.vboxusers.members = [ "ilya" ];

  # Enable automatic login for the user.
  services.getty.autologinUser = "ilya";
}
