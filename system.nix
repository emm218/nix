{ config, pkgs, ... }:

{
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  nixpkgs.overlays = [
    (final: prev: {
      labwc = prev.labwc.overrideAttrs (_: rec {
        passthru.providedSessions = [ "labwc" ];
      });
    })
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = false;

  networking.hostName = "nixos";
  time.timeZone = "America/New_York";

  i18n.defaultLocale = "en_US.UTF-8";

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.anon = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHCMaR8zi9L7xqGIDDArGb9gzREZBFdHto2UU4Pof6NL laptop"
    ];
    packages = with pkgs; [
      rsync
    ];
  };

  environment.systemPackages = with pkgs; [
    labwc
    papirus-icon-theme
  ];

  services.xserver.displayManager.sessionPackages = with pkgs; [ labwc ];

  programs.regreet = {
    enable = true;
    settings = {
      GTK.application_prefer_dark_theme = true;
    };
  };


  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
    roboto
    noto-fonts
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    viAlias = true;
  };

  programs.zsh.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  environment.sessionVariables = rec {
    XDG_BIN_HOME = "$HOME/.local/bin";
    PATH = [
      "${XDG_BIN_HOME}"
    ];
  };

  system.stateVersion = "23.05";

}

