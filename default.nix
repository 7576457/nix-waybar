{ pkgs, ... }:


let
  compositor = "sway";
  compositorModule = name: "${compositor}/${name}";
in
{
  programs.waybar = {
    enable = true;
    style = ./style.css;

    settings.mainBar = {
      layer = "top";
      position = "top";
      height = 32;
      spacing = 5;
      modules-left = [
        (compositorModule "workspaces")
      ];
      modules-center = [ "clock" ];
      modules-right = [
        (compositorModule "language")
        "network"
        "pulseaudio"
        "custom/display"
        "battery"
      ];
  
    } // import ./modules { inherit compositor; };
  };
}
