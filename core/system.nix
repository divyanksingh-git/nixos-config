{ config, pkgs, ... }:
{
  # Hostname
  networking.hostName = "dovah"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  
  # Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  #i18n.extraLocaleSettings = {
    #LC_ADDRESS = "en_US.UTF-8";
    #LC_IDENTIFICATION = "en_US.UTF-8";
    #LC_MEASUREMENT = "en_US.UTF-8";
    #LC_MONETARY = "en_US.UTF-8";
    #LC_NAME = "en_US.UTF-8";
    #LC_NUMERIC = "en_US.UTF-8";
    #LC_PAPER = "en_US.UTF-8";
    #LC_TELEPHONE = "en_US.UTF-8";
    #LC_TIME = "en_US.UTF-8";
  #};

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Locate
  services.locate = {
    enable = true;
    package = pkgs.mlocate;
    interval = "hourly";
    localuser = null;
  };
  
  # Pipewire
  sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire ={
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = false;
  };
  
  # Powermanagement
  powerManagement.enable = true;
  services.thermald.enable = true;
  services.tlp = {
      enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

        CPU_ENERGY_PERF_POLICY_ON_BAT = "powersave";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

        CPU_MIN_PERF_ON_AC = 0;
        CPU_MAX_PERF_ON_AC = 100;
        CPU_MIN_PERF_ON_BAT = 0;
        CPU_MAX_PERF_ON_BAT = 50;

       #Optional helps save long term battery health
       START_CHARGE_THRESH_BAT0 = 25; # 40 and bellow it starts to charge
       STOP_CHARGE_THRESH_BAT0 = 95; # 80 and above it stops charging

      };
  };
  
  # Doas
  security.doas.enable = true;
  security.doas.extraRules = [{
    groups = [ "wheel" ];
    keepEnv = true;
    persist = true;
  }];
  security.sudo.enable = false;

  environment.systemPackages = with pkgs; [
 
    # Utility
    ncpamixer
    bluetuith
    ncdu
    btop
    nvtop
    fastfetch 
    upower
    killall
  ];

  # Services
  services.upower.enable = true;
  services.dbus.enable = true;
  services.fstrim.enable = true;  

  # Nix settings
  nix.settings.auto-optimise-store = true;
  programs.nix-ld.enable = true;
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}

