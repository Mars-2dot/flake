{
    virtualisation.containers.enable = true;

    virtualisation.virtualbox.host.enable = true;
    virtualisation.virtualbox.guest.enable = true;
    users.extraGroups.vboxusers.members = [ "wheel" ];

    virtualisation.podman = {
      enable = true;
      defaultNetwork.settings.dns_enabled = true;
    };

    virtualisation.docker = {
        enable = true;
        rootless = {
          enable = true;
          setSocketVariable = true;
        };
    };
}