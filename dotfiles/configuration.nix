{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only

  networking.hostName = "nixDS"; # Define your hostname.

  # Select internationalisation properties.
  i18n = {
  #  consoleFont = "Lat2-Terminus16";
  #  consoleKeyMap = "la-latin1";
  #  defaultLocale = "en_US.UTF-8";
     inputMethod = {
       enabled = "fcitx";
       fcitx.engines = with pkgs.fcitx-engines; [mozc];
     };
  };

  # Set your time zone.
  time.timeZone = "America/Argentina/Buenos_Aires";

  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      powerline-fonts
    ];
  };
  environment.variables.TERMINAL="termite";
  environment.variables.EDITOR="vim";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget curl
    vim
    termite
    git
    firefox
    python python36Packages.pip
    nox
    feh imagemagick neofetch
    nodejs-9_x
    oh-my-zsh zsh
    numlockx
    i3status rofi
    font-awesome-ttf
    scala sbt openjdk
    ranger
  ];

  programs.zsh.enable = true;
  programs.zsh.interactiveShellInit = ''
    export PATH="$PATH:$HOME/.npm-packages/bin"
    export ZSH=${pkgs.oh-my-zsh}/share/oh-my-zsh/

    # Customize your oh-my-zsh options here
    ZSH_THEME="agnoster"
    plugins=(git cp jump nyan globalias)
  
    source $ZSH/oh-my-zsh.sh
  '';

  programs.zsh.promptInit = ""; # Clear this to avoid a conflict with oh-my-zsh

  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "latam";
  #services.xserver.xkbOptions = "eurosign:e";
  services.xserver.dpi = 157;

  services.xserver.windowManager.i3.enable = true;
  services.xserver.windowManager.i3.package = pkgs.i3-gaps;

  # Enable the KDE Desktop Environment.
  # services.xserver.displayManager.sddm.enable = true;
  # services.xserver.desktopManager.plasma5.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.ds = {
     isNormalUser = true;
     home = "/home/ds";
     extraGroups = ["wheel" "networkmanager"];
     uid = 1000;
     shell = pkgs.zsh;
  };
  users.extraUsers.root = {
    shell = pkgs.zsh;
  };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "18.03"; # Did you read the comment?

}
