{ lib, config, pkgs, stylix, ... }:
{
  imports = [ stylix.homeManagerModules.stylix ];

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
    extraConfig = (import ./hypr/land.nix {});
  };
  
  # Rofi
  programs.rofi = {
    enable = true;
  };
  
  # Mako
  services.mako.enable = true;
  
  # Kitty
  programs.kitty.enable = true;

  # Waybar
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    systemd.target = "hyprland-session.target";
    style = (import ./waybar/style.nix {});
    settings = [ (import ./waybar/config.nix {}) ];
  };

  # Fish
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';
    
    shellAliases = {
      ls = "lsd";
    };

    plugins = [
      # Enable a plugin (here grc for colorized command output) from nixpkgs
      { name = "grc"; src = pkgs.fishPlugins.grc.src; }
      
      {
        name = "sponge";
        src = pkgs.fetchFromGitHub {
          owner = "meaningful-ooo";
          repo = "sponge";
          rev = "384299545104d5256648cee9d8b117aaa9a6d7be";
          hash = "sha256-MdcZUDRtNJdiyo2l9o5ma7nAX84xEJbGFhAVhK+Zm1w=";
        };
     }
      
     { 
        name = "done";
        src = pkgs.fetchFromGitHub {
          owner = "franciscolourenco";
          repo = "done";
          rev = "d47f4d6551cccb0e46edfb14213ca0097ee22f9a";
          hash = "sha256-VSCYsGjNPSFIZSdLrkc7TU7qyPVm8UupOoav5UqXPMk=";
        };
     }
     
     { 
        name = "autopair.fish";
        src = pkgs.fetchFromGitHub {
          owner = "jorgebucaran";
          repo = "autopair.fish";
          rev = "4d1752ff5b39819ab58d7337c69220342e9de0e2";
          hash = "sha256-qt3t1iKRRNuiLWiVoiAYOu+9E7jsyECyIqZJ/oRIT1A=";
        };
     }    
     
     { 
        name = "fzf.fish";
        src = pkgs.fetchFromGitHub {
          owner = "PatrickF1";
          repo = "fzf.fish";
          rev = "dfdf69369bd3a3c83654261f90363da2aa1db8c9";
          hash = "sha256-x/q7tlMlyxZ1ow2saqjuYn05Z1lPOVc13DZ9exFDWoU=";
        };
     }

    { 
        name = "spark.fish";
        src = pkgs.fetchFromGitHub {
          owner = "jorgebucaran";
          repo = "spark.fish";
          rev = "90a60573ec8a8ecb741a861e0bfca2362f297e5f";
          hash = "sha256-cRSZeqtXSaEKuHeTSk3Kpmwf98mKJ986x1KSxa/HggU=";
        };
     }
    ];
  };

  # Theming
  gtk.iconTheme.package = pkgs.papirus-icon-theme;
  gtk.iconTheme.name = "Papirus-Dark";

  stylix = {
      base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-hard.yaml";
      polarity = "dark";
      autoEnable = true;
      image = ./cache/background.png;
      
      cursor.package = pkgs.numix-cursor-theme;
      
      targets.waybar = {
        #enableCenterBackColors = true;
        enableLeftBackColors = true;
        enableRightBackColors = true;
      };
      
 
  };
  # Environment Variables
  home.sessionVariables = {
    CHROME_EXECUTABLE="${pkgs.brave}/bin/brave";
    XCURSOR_SIZE="24";
  };
   
  home.file =  {
   
    # Background
    ".config/hypr/background.png".source = ./cache/background.png;
    
    # Hyprlock
    ".config/hypr/hyprlock.conf" = { text = (import ./hypr/lock.nix {});};
    
    # Hyprpaper
    ".config/hypr/hyprpaper.conf" = { text = (import ./hypr/paper.nix {});};
     
    # Waybar
    #".config/waybar/config" = { text = (import ./waybar/config.nix {});};
    #".config/waybar/style.css" = { text = (import ./waybar/style.nix {});};

    # Termusic
    ".config/termusic/config.toml" = { 
      text = (import ./misc/termusic-config.nix { music="${config.xdg.userDirs.music}"; }); 
     };
  };
}

