{ pkgs }:

let
  waybarModule = import ./default.nix { inherit pkgs; };

  config = pkgs.writeText "waybar-config.json" (
    builtins.toJSON waybarModule.programs.waybar.settings.mainBar
  );

  fontConfig = pkgs.makeFontsConf {
    fontDirectories = [ pkgs.nerd-fonts.symbols-only ];
  };

  native = pkgs.writeShellApplication {
    name = "waybar-preview-native";
    runtimeInputs = [
      pkgs.pulseaudio
      pkgs.waybar
    ];
    text = ''
      export FONTCONFIG_FILE=${fontConfig}
      exec waybar --config ${config} --style ${./style.css}
    '';
  };

  nested = pkgs.writeShellApplication {
    name = "waybar-preview";
    runtimeInputs = with pkgs; [
      coreutils
      pulseaudio
      sway
      waybar
    ];
    text = ''
      export FONTCONFIG_FILE=${fontConfig}

      runtime_dir="$(mktemp -d)"
      trap 'rm -rf "$runtime_dir"' EXIT

      cat > "$runtime_dir/sway.conf" <<EOF
      output * resolution 1280x720
      output * bg #241f31 solid_color
      default_border none
      focus_follows_mouse no
      exec waybar --config ${config} --style ${./style.css}
      bindsym Mod4+Shift+e exec swaymsg exit
      EOF

      export WLR_BACKENDS=wayland
      export WLR_LIBINPUT_NO_DEVICES=1
      sway --config "$runtime_dir/sway.conf"
    '';
  };
in
{
  inherit native nested;
}
