{ pkgs, misc, ... }: {
  # DO NOT EDIT: This file is managed by fleek. Manual changes will be overwritten.
   home.shellAliases = {
    "apply-sabre" = "nix run --impure home-manager/master -- -b bak switch --flake .#spytec@sabre";
    
    "fleeks" = "cd ~/.local/share/fleek";
    
    "latest-fleek-version" = "nix run https://getfleek.dev/latest.tar.gz -- version";
    
    "update-fleek" = "nix run https://getfleek.dev/latest.tar.gz -- update";
    
    # bat --plain for unformatted cat
    catp = "bat -P";
    
    # replace cat with bat
    cat = "bat";
    };
}
