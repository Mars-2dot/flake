{
    programs.nix-ld.enable = true;
    programs.nix-ld.libraries = with pkgs; [
      # Add any missing dynamic libraries for unpackaged programs
      # here, NOT in environment.systemPackages
      "/home/ilya/.jdks/corretto-11.0.23/bin/java"
    ];
}