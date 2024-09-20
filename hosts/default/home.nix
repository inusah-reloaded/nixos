{ config, pkgs, inputs, ...}:

{
  home.username = "cryptic";
  home.homeDirectory = "/home/cryptic";

  imports = [
    ../../modules/home-manager/bemenu.nix
    ../../modules/home-manager/waybar.nix
    ../../modules/home-manager/hypridle.nix
    ../../modules/home-manager/hyprlock.nix
    ../../modules/home-manager/kitty.nix
    ../../modules/home-manager/hyprland.nix
    ../../modules/home-manager/git.nix
    ../../modules/home-manager/emacs.nix
  ];

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
  
  home.packages = with pkgs; [
    git
    vim
    keyd
    wget
    htop
    brave
    kitty
    wofi
    xfce.thunar
    mako
    dunst
    pipewire
    wireplumber
    flameshot
    libsForQt5.polkit-kde-agent
    zathura
    libreoffice
    audacious
    vlc
    alsa-utils
    libsForQt5.qt5.qtwayland
    whatsapp-for-linux
    octaveFull
  ];

  home.sessionVariables = {
    EDITOR = "emacs";
  };

  home.pointerCursor = {
    gtk.enable = true;
    #x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };

  gtk = {
    enable = true;

    theme = {
      package = pkgs.flat-remix-gtk;
      name = "Flat-Remix-GTK-Grey-Darkest";
    };

    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };

    font = {
      name = "Sans";
      size = 11;
    };
      
  };

  
    #services.hypridle = {
    #  enable = true;
    #  settings = {
    #    general = {
    #      after_sleep_cmd = "hyprctl dispatch dpms on";
    #      ignore_dbus_inhibit = false;
    #      lock_cmd = "hyprlock";
    #    };

    #    listener = [
    #      {
    #        timeout = 200;
    #        on-timeout = "hyprlock";
    #      }
    #      {
    #        timeout = 1200;
    #        on-timeout = "hyprctl dispatch dpms off";
    #        on-resume = "hyprctl dispatch dpms on";
    #      }
    #    ];
    #  };
    #};

      
}
