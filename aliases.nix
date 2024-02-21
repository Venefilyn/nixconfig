{ pkgs, misc, ... }: {
   home.shellAliases = {
    "apply-sabre" = "nix run --impure home-manager/master -- -b bak switch --flake .#spytec@sabre";

    "nixconfig" = "cd ~/.config/home-manager/";

    # bat --plain for unformatted cat
    catp = "bat -P";

    # replace cat with bat
    cat = "bat";
    };
}
