{ config, pkgs, misc, ... }: {
  nixpkgs = {
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages

      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = (_: true);


    };
  };


  # packages are just installed (no configuration applied)
  # programs are installed and configuration applied to dotfiles
  home.packages = with pkgs; [
    # user selected packages
    helix
    ripgrep
    bat
    gphoto2
    devpod
    devpod-desktop
    devbox
    sqlite
    git
    gh
    yarn
    nodejs
    sunshine
    zsh
    hyfetch
    zsh-fzf-tab
    htop
    github-cli
    glab
    lazygit
    jq
    yq-go
    neofetch
    btop
    cheat
    just
    rclone
    yubikey-manager
    pre-commit
    ansible
    topgrade
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];
  fonts.fontconfig.enable = true;
  home.stateVersion =
    "23.11"; # To figure this out (in-case it changes) you can comment out the line and see what version it expected.
  programs.home-manager.enable = true;
}
