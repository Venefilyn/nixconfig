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
    nodejs
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
    ffmpeg
    openssl
    sparrow
    bun
    corepack
    bitwarden-cli
    cosign
    helix
    hyperfine
    fish
    grc
    devcontainer
    wasabiwallet
    nerd-fonts.fira-code
  ];
  fonts.fontconfig.enable = true;

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
