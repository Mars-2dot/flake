{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [ "electron-25.9.0"];
  };

  environment.systemPackages = with pkgs; [
    # Desktop apps
    audacity
    chromium
    telegram-desktop
    alacritty
    obs-studio
    rofi
    wofi
    mpv
    kdenlive
    discord
    gparted
    obsidian
    zoom-us
    pcmanfm-qt
    kitty
    mc
    google-chrome
    pkgs.gnome-calculator
    postman


    # Coding stuff
    gnumake
    gcc
    nodejs
    #python
    #(python3.withPackages (ps: with ps; [ requests ]))

    # CLI utils
    neofetch
    file
    tree
    wget
    git
    fastfetch
    htop
    nix-index
    unzip
    scrot
    ffmpeg
    light
    lux
    mediainfo
    ranger
    zram-generator
    cava
    zip
    ntfs3g
    yt-dlp
    brightnessctl
    swww
    openssl
    lazygit
    bluez
    libsecret
    gnomeExtensions.dark-style
    git-credential-oauth
    bluez-tools
    nautilus
    catppuccin-papirus-folders
    catppuccin-cursors
    catppuccin-gtk
    ventoy-full

    # GUI utils
    feh
    imv
    dmenu
    screenkey
    mako
    gromit-mpx

    # Xorg stuff
    #xterm
    #xclip
    #xorg.xbacklight

    # Wayland stuff
    xwayland
    wl-clipboard
    cliphist

    # WMs and stuff
    #herbstluftwm
    hyprland
    seatd
    xdg-desktop-portal-hyprland
    polybar
    waybar
    gnome-multi-writer

    # Sound
    pipewire
    pulseaudio
    pamixer

    # GPU stuff 
    glaxnimate

    # Screenshotting
    grim
    grimblast
    slurp
    flameshot
    swappy

    # Other
    home-manager
    spice-vdagent
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    papirus-nord

    # vpn
    wireguard-tools
    openconnect

    #virtualization
    docker
    docker-compose
    podman
    dive
    podman-tui
    kubernetes
    kubernetes-helm
    lens

    #apps
    distrobox
    appimage-run
    appimagekit
    btop
    appimagekit
    appimage-run
    qbittorrent
    firefox
    steam-run
    steam
    wineWowPackages.waylandFull
    pkgs.onlyoffice-bin
    gnome.gnome-control-center
    spotify

    #develop
    jetbrains.webstorm
    jetbrains.pycharm-professional
    jetbrains.idea-ultimate
    jetbrains.goland
    jetbrains.datagrip
    jetbrains.clion
    vscode
    dbeaver-bin
    drawio
    maven
    go
    jdk11
    jdk17
    jdk8
    locale
    # networking

  ];

  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    noto-fonts-emoji
    twemoji-color-font
    font-awesome
    powerline-fonts
    powerline-symbols
    (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
  ];
}
