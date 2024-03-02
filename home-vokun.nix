{ pkgs, ... }:
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
    style = (import ./waybar-style.nix {});
    #settings = [ (import ./waybar-config.nix {})]; 
  };

  # Environment Variables
  home.sessionVariables = {
    CHROME_EXECUTABLE="${pkgs.brave}/bin/brave";
    XCURSOR_SIZE="24";
  };
   
  home.file =  {
    # Hyprlock
    ".config/hypr/hyprlock.conf" = { text = (import ./hyprlock.nix {});};
    
    # Hyprpaper
    ".config/hypr/hyprpaper.conf" = { text = (import ./hyprpaper.nix {});};

    # Termusic
    ".config/termusic/config.toml" = { text = (import ./termusic-config.nix { homeDir="/home/vokun"; }); };
  };
}
