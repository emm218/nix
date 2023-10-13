{ config, pkgs, ... }:

{
  home.username = "anon";
  home.homeDirectory = "/home/anon";

  home.stateVersion = "23.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    (writeShellScriptBin "apply-system" ''
       sudo nixos-rebuild switch --flake "$XDG_CONFIG_HOME"/nixos#
    '')
    zsh-git-prompt
  ];

  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
  };
  
  xdg.enable = true;

  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    enableCompletion = true;
    autocd = true;
    history.path = "${config.xdg.cacheHome}/zsh_history";
    syntaxHighlighting.enable = true;
    historySubstringSearch.enable = true;
  };
    
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.git = {
    enable = true;
    userName = "Emmy Emmycelium";
    userEmail = "32604310+emm218@users.noreply.github.com";
    extraConfig = {
     init.defaultBranch = "main";
    };
    signing = {
      key = "7A38474EF1134A2497C02ABF09C5F43483275317";
      signByDefault = true;
    };
  };
  
  programs.eza = {
    enable = true;
    enableAliases = true;
  };

  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "FiraCode Nerd Font Mono:size=12";
        pad = "16x16";
      };
      colors = {
      	alpha = 0.6;
	background = "11111b";
	foreground = "f8f8f2";

	regular0 = "21222c";  # black
        regular1="ff5555";  # red
        regular2="50fa7b";  # green
        regular3="f1fa8c";  # yellow
        regular4="bd93f9";  # blue
        regular5="ff79c6";  # magenta
        regular6="8be9fd";  # cyan
        regular7="f8f8f2";  # white

        bright0="6272a4";   # bright black
        bright1="ff6e6e";   # bright red
        bright2="69ff94";   # bright green
        bright3="ffffa5";   # bright yellow
        bright4="d6acff";   # bright blue
        bright5="ff92df";   # bright magenta
        bright6="a4ffff";   # bright cyan
        bright7="ffffff";   # bright white
      };
    };
  };

  programs.librewolf.enable = true;
}
