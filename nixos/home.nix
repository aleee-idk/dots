{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "aleidk";
  home.homeDirectory = "/home/aleidk";
  programs.git = {
    enable = true;
    userName = "aleidk";
    userEmail = "ale.navarro.parra@gmail.com";
  };

  home.packages = with pkgs; [
    alacritty
    bat
    duf
    exa
    fd
    fzf
    imv
    jq
    lazygit
    mpv
    neovim
    nodePackages.pnpm
    nodejs
    python3
    ripgrep
    sd
    signal-desktop
    tealdeer
    tmux
    zellij
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
