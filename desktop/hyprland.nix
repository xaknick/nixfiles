{ pkgs, ... }:
{
  # Enable cachix to avoid Hyprland recompilation
  nix.settings = {
    substituters = [ "https://hyprland.cachix.org" ];
    trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
  };

  # Enable Hyprland
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";

  environment.systemPackages = with pkgs; [
    hyprcursor
    hyprlock
    hypridle
    hyprshot
    hyprpolkitagent
    wpaperd

    # Required services or libraries
    kdePackages.breeze-icons
    qt6.qtwayland
    qt5.qtwayland
    poweralertd
    wl-clipboard
    waybar
    fish # for waybar scripts
    rofi-wayland
    swaynotificationcenter
    wlogout
    libnotify
    nwg-look # GTK theme settings
    wev # event viewer for keyboard key detection
    brightnessctl
    pyprland

    # Network by NM (option 1)
    networkmanagerapplet
    # Network by iwg (option 2)
    # iwgtk # GTK configurator
    # impala # TUI configurator

    # Sound
    pamixer
    pavucontrol

    # Common
    vlc
    gwenview
    okular
    libreoffice-qt6
    hunspell
    hunspellDicts.ru_RU
  ];

  # Services
  services.upower.enable = true;
  services.dbus = {
    enable = true;
    implementation = "broker";
    packages = with pkgs; [
      xfce.xfconf
      gnome2.GConf
    ];
  };
  services.mpd.enable = true;
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.sddm.enableGnomeKeyring = true;


  # Network by NM (option 1)
  # networking.networkmanager.enable = lib.mkForce true;

  # Network by iwd (option 2)
  # networking.wireless.iwd = {
  #   enable = true;
  #   settings = {
  #     General = {
  #       EnableNetworkConfiguration = true;
  #     };
  #   };
  # };
  # networking.networkmanager.enable = lib.mkForce false;

  # Thunar file manager
  programs.thunar.enable = true;
  programs.xfconf.enable = true;
  programs.thunar.plugins = with pkgs.xfce; [
    thunar-archive-plugin
    thunar-volman
  ];
  services.gvfs.enable = true; # Mount, trash, and other functionalities
  services.tumbler.enable = true; # Thumbnail support for images
  xdg.mime.defaultApplications = {
    "inode/directory" = "thunar.desktop";
  };
}
