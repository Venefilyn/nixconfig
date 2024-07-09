{ pkgs, misc, ... }: {
    home.username = "spytec";
    home.homeDirectory = "/home/spytec";
    programs.git = {
        enable = true;
        aliases = {
            prune-all = "!git remote | xargs -n 1 git remote prune";
            pullr = "pull --rebase";
            ll = "log --oneline";
            pushfwl = "push --force-with-lease";
            pushall = "!git remote | xargs -L1 git push --all";
            graph = "log --decorate --oneline --graph";
            add-nowhitespace = "!git diff -U0 -w --no-color | git apply --cached --ignore-whitespace --unidiff-zero -";
        };
        userName = "Freya Gustavsson";
        userEmail = "freya@venefilyn.se";
        extraConfig = {
            feature.manyFiles = true;
            init.defaultBranch = "main";
            gpg.format = "ssh";
        };

        signing = {
            key = "~/.ssh/id_ed25519";
            signByDefault = builtins.stringLength "~/.ssh/id_ed25519" > 0;
        };

        lfs.enable = true;
        ignores = [ ".direnv" "result" ];
  };

}
