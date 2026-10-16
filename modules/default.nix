{ compositor }:

{
  "${compositor}/workspaces" = import ./workspaces.nix;
  "${compositor}/language" = import ./language.nix;
  clock = import ./clock.nix;
  network = import ./network.nix;
  pulseaudio = import ./sound.nix;
  "custom/display" = import ./display.nix;
  battery = import ./battery.nix;
}
