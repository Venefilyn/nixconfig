{ pkgs, misc, ... }: {
  programs.eza.enableAliases = true;

  programs.eza.extraOptions = [
    "--group-directories-first"
    "--header"
  ];

  programs.bat.config = {
    theme = "TwoDark";
  };
  # zsh
  programs.zsh.profileExtra = ''
    [ -r ~/.nix-profile/etc/profile.d/nix.sh ] && source  ~/.nix-profile/etc/profile.d/nix.sh
    export XCURSOR_PATH=$XCURSOR_PATH:/usr/share/icons:~/.local/share/icons:~/.icons:~/.nix-profile/share/icons
  '';

  programs.zsh = {
    enableCompletion = true;
    enable = true;
    initExtra = ''
      if [[ $(ps -o command= -p "$PPID" | awk '{print $1}') != 'fish' ]]
      then
          exec fish -l
      fi
    '';
  };
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';
    plugins = [
      { name = "grc"; src = pkgs.fishPlugins.grc.src; }
      { name = "bass"; src = pkgs.fishPlugins.bass; }
    ];
  };
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
  programs.neovim.plugins = with pkgs.vimPlugins; [
    fugitive
  ];
}
