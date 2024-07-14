{
    virtualisation.containers.enable = true;

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