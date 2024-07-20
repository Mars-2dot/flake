{
   dconf.settings = {
        "org/gnome/desktop/interface" = {
          color-scheme = "prefer-dark";
        };
    };

    gtk = {
      enable = true;
      font = {
        package = (pkgs.nerdfonts.override { fonts = [ "Mononoki" ]; });
        name = "Mononoki Nerd Font Regular";
        size = 10;
      };

      theme = {
        name = "Catppuccin-Macchiato-Compact-Pink-Dark";
        package = pkgs.catppuccin-gtk.override {
          accents = [ "pink" ];
          size = "compact";
          tweaks = [ "rimless" "black" ];
          variant = "macchiato";
        };
      };

      iconTheme = {
        package = (pkgs.catppuccin-papirus-folders.override { flavor = "mocha"; accent = "pink"; });
        name  = "Papirus-Dark";
      };

      cursorTheme = {
        name = "Catppuccin-Mocha-Pink";
        package = pkgs.catppuccin-cursors.mochaPink;
      };

      gtk3.extraConfig = {
        Settings = ''
          gtk-application-prefer-dark-theme=1
        '';
      };

      gtk4.extraConfig = {
        Settings = ''
          gtk-application-prefer-dark-theme=1
  	      gtk-cursor-theme-name=Catppuccing-Mocha-Pink
        '';
      };
    };
    home.sessionVariables.GTK_THEME = "Gruvbox-Dark";
}