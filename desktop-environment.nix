{ config, pkgs, pkgs-master, ... }:
{
  # Login Manager (tuigreet)
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --asterisks --cmd Hyprland";
        user = "greeter";
      };
    };
  };
  
  # Hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ 
      pkgs.xdg-desktop-portal
      pkgs.xdg-desktop-portal-gtk
    ];
  };
  programs.waybar.enable = true;

  # Polkit
  security.polkit.enable = true;
  systemd.user.services.polkit-authentication-agent = {
    enable = true;
    description = "polkit-gnome-authentication-agent-1";
    wantedBy = [ "default.target" ];
    wants = [ "default.target" ];
    after = [ "default.target" ];
    serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
  };
  
  
  # Pam
  security.pam.services.swaylock = {
    text = ''
      auth include login
    '';
  };

  environment.systemPackages = (with pkgs; [
    # Hyprland
    mako
    libnotify
    hyprpaper
    rofi-wayland
    kitty
    hypridle
    hyprpicker
    cliphist
    brightnessctl
    pamixer
    playerctl
    
    # Utility
    xdg-user-dirs
    udiskie
    xdg-utils
    polkit_gnome
    
    # Applications
    (brave.override {
    commandLineArgs = [ "--enable-chrome-browser-cloud-management --enable-features=UseOzonePlatform --ozone-platform=x11"];
    })
    mate.atril
    termusic
    mc
    xfce.mousepad
    mpv
    qview
    calcurse
    calc
    grim
  ])
  
  ++
  
  (with pkgs-master; [
    hyprlock
  ]);

  # Fonts
  fonts.packages = with pkgs; [
    font-awesome
    (nerdfonts.override { fonts = [ "FiraCode" ]; })  
  ];
  
  # Services
  services.udisks2.enable = true;
  services.gvfs.enable = true;
}
