{ pkgs, misc, ... }: {
   home.shellAliases = {
    "apply-sabre" = "nix run --impure home-manager/master -- -b bak switch --flake .#spytec@sabre";
    "apply-frieren" = "nix run --impure home-manager/master -- -b bak switch --flake .#spytec@frieren";

    nixconfig = "cd ~/.config/home-manager/";
    nixconfigcode = "code ~/.config/home-manager/";

    # bat --plain for unformatted cat
    catp = "bat -p";

    # replace cat with bat
    cat = "bat";

    # add vscode
    code = "flatpak run com.visualstudio.code";

    # For generating progress reports for OpenStreetMap
    osm_mp4 = "ffmpeg -framerate 1 -pattern_type glob -i '*.png' -c:v libx264 -r 30 -pix_fmt yuv420p out.mp4";
    osm_gif = "ffmpeg -i out.mp4 -vf \"fps=1,scale=1920:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse\" -loop 0 out.gif";
    osm_progress = "osm_mp4 && osm_gif";
    dlsrcam = "gio mount -s gphoto2 & wait $last_pid && gphoto2 --stdout --capture-movie | ffmpeg -i - -vcodec rawvideo -pix_fmt yuv420p -threads 0 -f v4l2 /dev/video0";
  };
}
