{ config, pkgs, ... }:
{
  home.username = "vokun";
  home.homeDirectory = "/home/vokun";
  
  home.packages = []; 
  # Git
  programs.git = {
    enable = true;
    userName = "divyanksingh-git";
    userEmail = "div.singh.7@protonmail.com";
  };

  # Hyprland
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = (import ./hyprland.nix {});
  };
 
  # Waybar
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    style = (import ./waybar-style.nix {});
    settings = [ (import ./waybar-config.nix {}) ];
  };
  
  # Zsh
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;

    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";
  
    oh-my-zsh = {
      enable = true;
      plugins = [ 
        "command-not-found" 
        "bgnotify" 
        "colored-man-pages" 
        "extract" 
        "web-search"
        "history-substring-search" 
      ];
      theme = "robbyrussell";
    };
  };

  # Environment Variables
  home.sessionVariables = {
    CHROME_EXECUTABLE="${pkgs.brave}/bin/brave";
    XCURSOR_SIZE="24";
  };
   
  home.file =  {
    # Background
    ".config/hypr/background.png".source = ./background.png;
    
    # Hyprlock
    ".config/hypr/hyprlock.conf" = { text = (import ./hyprlock.nix {});};
    
    # Hyprpaper
    ".config/hypr/hyprpaper.conf" = { text = (import ./hyprpaper.nix {});};

    # Termusic
    ".config/termusic/config.toml" = { 
      text = (import ./termusic-config.nix { music="${config.xdg.userDirs.music}"; }); 
     };
  };
}
