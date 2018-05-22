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
  boot.loader.grub.useOSProber = true; #os-prober must be installed

  fileSystems."/media/MD"=
  { device = "/dev/disk/by-uuid/BEE4A15FE4A11B23";
    fsType = "ntfs";
  };

  nixpkgs.config.allowUnfree = true;

  services.xserver.videoDrivers = ["amdgpu"];
  #hardware.opengl.driSupport32Bit = true;

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

      noto-fonts noto-fonts-cjk noto-fonts-emoji
      liberation_ttf
      fira fira-code fira-code-symbols
      mplus-outline-fonts
      dina-font
      proggyfonts
      font-awesome-ttf

    ];
  };
  environment.variables.TERMINAL="termite";
  environment.variables.EDITOR="vim";
  environment.variables.PIP_TARGET="$HOME/.pip-packages";

 environment.systemPackages = with pkgs; [
    keepassxc
    xsel
    vlc
    evince
    htop
    wget curl postman
    transmission
    less
    vim neovim
    termite
    git
    firefox #qutebrowser #chromium
    youtube-dl
    nox
    feh imagemagick neofetch scrot compton sxiv
    nodejs-9_x
    oh-my-zsh zsh
    numlockx
    i3status rofi i3blocks-gaps
    font-awesome-ttf
    scala sbt openjdk
    ranger
    python python36Packages.pip
    #pywal
    jetbrains.webstorm jetbrains.idea-ultimate android-studio
    vscode
    pavucontrol
    os-prober
    awscli
  ];

  programs.zsh.enable = true;
  programs.zsh.interactiveShellInit = ''
    export PATH="$PATH:$HOME/.npm-packages/bin"
    export ZSH=${pkgs.oh-my-zsh}/share/oh-my-zsh/
    export PIPMODULES=$HOME/.pip-packages
    export PYTHONPATH=$PYTHONPATH:$PIPMODULES

    (neofetch)
    (cat ~/.cache/wal/sequences &)

    # Customize your oh-my-zsh options here
    ZSH_THEME="agnoster"
    plugins=(git cp jump nyan globalias)
  
    source $ZSH/oh-my-zsh.sh

    alias -g zshconfig="vim ~/.zshrc"
    alias -g ohmyzsh="vim ~/.oh-my-zsh"
    alias -g reload=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"
    alias -g ytp='youtube-dl -cio "%(playlist_index)s-%(title)s.%(ext)s" '
    alias -g lsn="ls --color=no"
    alias -g pbcopy='xsel --clipboard --input'
    alias -g pbpaste='xsel --clipboard --output'
    alias -g sxiv='sxiv -s f'

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
